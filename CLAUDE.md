# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

A Nix flake-based dotfiles repository that builds a macOS system via `nix-darwin` + `home-manager`. The only configured host today is `macbook-air-m2` (aarch64-darwin), but the structure is designed to scale to additional hosts.

## Common commands

All commands assume the devShell (entered automatically via `direnv`/`.envrc`, or manually via `nix develop`).

- Build the current host without activating (fzf-picks the host):
  - `nix run .#build-darwin`
- Build **and** activate (runs `sudo darwin-rebuild switch`):
  - `nix run .#switch-darwin`
- Format the whole tree (treefmt: `nixfmt` for `*.nix`, `oxfmt` for everything else listed in `treefmt.nix`):
  - `nix fmt`
- Run pre-commit checks (`gitleaks` + `treefmt`) manually:
  - `nix flake check`
- Update a single flake input:
  - `nix flake update <input-name>` (e.g. `nix flake update nixpkgs`)

The pre-commit `shellHook` is wired into the default devShell, so hooks install on first `nix develop` / `direnv allow`.

## Architecture

### Top-level layout

- `flake.nix` — single entry point. Defines `apps` (build/switch), `devShells`, `formatter` (from `treefmt.nix`), `checks` (pre-commit, from `pre-commit.nix`), and `darwinConfigurations`. `mkDarwinHost` is the host factory.
- `treefmt.nix` — formatter config consumed by `treefmt-nix`.
- `pre-commit.nix` — git-hooks config; uses `self.formatter` so the pre-commit `treefmt` hook is always identical to `nix fmt`.
- `modules/agent-skills/` — a **nested flake** (its own `flake.nix` + `default.nix`) consumed by the outer flake via `inputs.agent-skills.url = "path:./modules/agent-skills"`. It aggregates external agent-skill repositories (anthropic, vercel, mizchi, etc.) into one home-manager module.

### Host ↔ shared-module split

The repo follows a deliberate two-layer pattern:

- `modules/` — the **shared library**. Each file/directory describes one tool or system facet (e.g. `modules/home-manager/tool/lazygit.nix`, `modules/nix-darwin/system/dock.nix`). These files never reference a host.
- `hosts/<host>/modules/` — **thin shims** that select which shared modules apply to that host. They typically just contain a `default.nix` that builds an `imports = map (f: base + "/${f}") [...]` list, where `base` points back into `modules/`. See `hosts/macbook-air-m2/modules/home-manager/tool/default.nix` for the canonical example.

When adding a new tool:

1. Create the shared module under `modules/home-manager/tool/` (or the appropriate category).
2. Add its filename to the per-host import list in `hosts/<host>/modules/home-manager/tool/default.nix`.

Do **not** put host-specific values inside the shared module — read them from `profile` instead (see below).

### Profile injection

`hosts/<host>/profile.nix` defines host-scoped values (`username`, git identity, signing key, …). `flake.nix` passes the profile through `specialArgs`, and `hosts/<host>/modules/home-manager/default.nix` re-passes it via `home-manager.extraSpecialArgs`. Any shared module that needs these values takes `{ profile, ... }` as a function argument (see `modules/home-manager/home/default.nix`).

### Module categories (shared)

- `modules/nix-darwin/` — system-level: `system/` (macOS defaults: dock, finder, keyboard, trackpad), `homebrew/`, `fonts/`, `launchd/`, `security/`, `nix/` (substituters, experimental features), `home-manager/` (wires `useGlobalPkgs`/`useUserPackages`).
- `modules/home-manager/` — user-level, grouped by purpose:
  - `core/` — shell + terminal (zsh, ghostty, git, oh-my-posh)
  - `editor/` — neovim
  - `language/` — runtimes (deno, go, node, python, erlang, gleam)
  - `lsp/` — language servers consumed by neovim
  - `tool/` — CLI utilities (most files are 1–3 lines, just enabling a `programs.<x>` or adding a package)
  - `home/` — `home.username` / `homeDirectory` / `stateVersion`

### Adding a new host

1. Create `hosts/<new-host>/` with `profile.nix`, `default.nix`, and a `modules/` tree mirroring the existing host.
2. Register it in `flake.nix` under `darwinConfigurations` via `mkDarwinHost`. The `apps.build-darwin` / `apps.switch-darwin` fzf pickers will pick it up automatically.

## Conventions

- Nix files are formatted with **`nixfmt`** (via treefmt). Don't hand-format.
- Pre-commit blocks commits on unformatted files or detected secrets (`gitleaks`); fix locally rather than bypassing.
- Binary caches are pre-configured in `modules/nix-darwin/nix/default.nix` (`airrnot.cachix.org`, `nix-community.cachix.org`, `ryoppippi.cachix.org`) — builds should hit the cache before compiling from source.
- `config.allowUnfree = true` is set globally in `flake.nix`, and `nur-packages.overlays.default` is applied — unfree packages and NUR packages are available without further opt-in per module.
