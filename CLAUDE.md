# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS using Nix Flakes, Home Manager, and nix-darwin. Manages 78 Home Manager modules, 23 Homebrew casks, and 5 Mac App Store apps for Apple Silicon (aarch64-darwin).

## Architecture

### Host-based Configuration System

The repository uses a host-based structure where configurations are organized by machine:

**Host Directory** (`hosts/<hostname>/`)
- Each host has its own `default.nix` that defines `homeConfigurations` and `darwinConfigurations`
- Host-specific module selections live in `hosts/<hostname>/modules/`
- Currently supports: `macbook-air-m2`

**Shared Modules** (`modules/`)
- Reusable modules shared across all hosts
- Two main categories: `home-manager/` and `nix-darwin/`

### Module Organization

**Home Manager Modules** (`modules/home-manager/`)
- `core/` - Essential shell and terminal tools (git, zsh, ghostty, zellij, oh-my-posh)
- `editor/` - Text editors (neovim, vscode)
- `home/` - Home Manager base configuration
- `language/` - Programming language runtimes (deno, go, node, python, etc.)
- `lsp/` - Language servers for development
- `tool/` - CLI utilities and development tools

**nix-darwin Modules** (`modules/nix-darwin/`)
- `fonts/` - System fonts
- `homebrew/` - Homebrew casks and Mac App Store apps
- `launchd/` - Launch daemons
- `nix/` - Nix daemon settings
- `security/` - Security settings
- `system/` - macOS system preferences (dock, finder, keyboard, trackpad)

**Host-specific Modules** (`hosts/<hostname>/modules/`)
- Each host imports selected modules from `modules/` using relative paths
- Pattern: `let base = ../../modules/home-manager/<category>; in { imports = map (f: base + "/${f}") [ "file1.nix" "file2.nix" ]; }`

### Profile-based Configuration

User-specific settings are isolated in `profile.nix`:
```nix
{
  username = "airrnot";
  gitUsername = "airRnot1106";
  gitEmail = "...";
  gitSigningKey = "...";
}
```

Injected into all modules via `extraSpecialArgs` in `flake.nix`. Access in modules:
```nix
{ profile, ... }: {
  home.username = profile.username;
}
```

### Package Overlay System

Four overlays composed in `hosts/<hostname>/default.nix` (applied in order):
1. `edgepkgs` - Bleeding-edge packages (claude-code, etc.)
2. `neovim-nightly-overlay` - Neovim nightly builds
3. `nur-packages` - Custom NUR packages (github:airRnot1106/nur-packages)
4. `modules/overlays` - Local package overlays

### Module Pattern

Each tool/package is a separate file with minimal configuration:
```nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [ package-name ];
}
```

Enable/disable features by adding/removing imports in `hosts/<hostname>/modules/<category>/default.nix` files using the pattern:
```nix
let
  base = ../../modules/home-manager/<category>;
in
{
  imports = map (f: base + "/${f}") [
    "tool1.nix"
    "tool2.nix"
  ];
}
```

## Common Commands

### Initial Setup
```bash
# Edit profile.nix first, then:
nix run .#update-home-manager
nix run .#update-nix-darwin
```

### Apply Configuration Changes
```bash
# All changes (flake update + home-manager + nix-darwin)
nix run

# Individual updates (from flake.nix apps)
nix run .#update-flake                      # Update flake.lock
nix run .#update-home-manager               # Apply Home Manager (default: macbook-air-m2)
nix run .#update-home-manager -- <hostname> # Specify host
nix run .#update-nix-darwin                 # Apply nix-darwin (default: macbook-air-m2)
nix run .#update-nix-darwin -- <hostname>   # Specify host

# Manual with trace (for debugging)
nix run nixpkgs#home-manager -- switch --flake .#macbook-air-m2 --show-trace --impure
darwin-rebuild switch --flake .#macbook-air-m2 --show-trace --impure
```

**Required flags**:
- `--show-trace` - Show full error traces (essential for debugging)
- `--impure` - Allow reading system environment variables

### Development
```bash
nix develop                # Enter dev shell (direnv, git, lua-language-server, nil)
nix fmt                    # Format code (jsonfmt, kdlfmt, stylua, nixfmt via treefmt)
nix flake check            # Validate configuration and formatting
nix flake update           # Update all inputs
nix flake lock --update-input nixpkgs  # Update specific input
```

## MCP Server Usage

This repository benefits from two MCP servers available in Claude Code:

### NixOS MCP
Search for packages, options, and version history:
```
# Search for packages
mcp__nixos__nix: action=search, source=nixos, type=packages, query="package-name"

# Search for Home Manager options
mcp__nixos__nix: action=search, source=home-manager, type=options, query="programs.neovim"

# Check package version history
mcp__nixos__nix_versions: package="neovim"
```

Use cases:
- Finding package names before adding to modules
- Discovering available configuration options
- Checking which nixpkgs version introduced a package

### Context7 MCP
Access up-to-date documentation for Nix ecosystem:
```
# Resolve library ID first
mcp__context7__resolve-library-id: libraryName="home-manager"
# Returns: /nix-community/home-manager

# Query documentation
mcp__context7__query-docs: libraryId="/nix-community/home-manager", query="how to configure neovim"
```

Useful for:
- Home Manager module documentation (`/nix-community/home-manager`)
- nix-darwin documentation (if available)
- Latest API references and examples

**When to use**: Always search with MCP servers before adding new packages or configuring complex modules to ensure correct package names and option syntax.

## Adding New Packages

### Home Manager Package
1. Create `modules/home-manager/<category>/<tool-name>.nix`:
   ```nix
   { pkgs, ... }:
   {
     home.packages = with pkgs; [ tool-name ];
   }
   ```
2. Add to `hosts/<hostname>/modules/home-manager/<category>/default.nix`:
   ```nix
   imports = map (f: base + "/${f}") [
     # ... existing imports ...
     "tool-name.nix"  # Add this line
   ];
   ```
3. Run `nix fmt && nix flake check`

### Homebrew Cask (GUI apps)
1. Create `modules/nix-darwin/homebrew/casks/<app-name>.nix`
2. Add to `hosts/<hostname>/modules/nix-darwin/homebrew/casks/default.nix`
3. Run `nix run .#update-nix-darwin`

### Configuration Files
Place in module directory and reference via `xdg.configFile`:
```nix
xdg.configFile."tool-name".source = ./configs/tool-name;
```

### Program with Settings
Use Home Manager's `programs.<name>` module:
```nix
{ pkgs, ... }:
{
  programs.tool-name = {
    enable = true;
    settings = { ... };
  };
}
```

## Important Files

- `flake.nix` - Central orchestration, flake inputs/outputs, imports host configs
- `profile.nix` - User-specific settings (git, username)
- `hosts/<hostname>/default.nix` - Host entry point (defines homeConfigurations, darwinConfigurations, overlays)
- `hosts/<hostname>/modules/` - Host-specific module selections
- `modules/home-manager/` - Shared Home Manager modules
- `modules/nix-darwin/` - Shared nix-darwin modules
- `modules/overlays/` - Local package overlays
- `treefmt/default.nix` - Formatter configuration
- `pre-commit/default.nix` - Pre-commit hooks configuration

## Task Completion Requirements

**ALWAYS run after any changes:**
```bash
nix fmt && nix flake check
```

This ensures code formatting (jsonfmt, kdlfmt, stylua, nixfmt) and validates configuration syntax.
