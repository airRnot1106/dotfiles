# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS using Nix Flakes, Home Manager, and nix-darwin. Manages 78 Home Manager modules, 23 Homebrew casks, and 5 Mac App Store apps for Apple Silicon (aarch64-darwin).

## Architecture

### Two-Layer Configuration System

**Home Manager** (`home/`) - User-level packages and configurations
- Entry: `home/default.nix` → `home/modules/default.nix` → category modules
- Categories: `dev/`, `editor/`, `git/`, `shell/`, `util/`

**nix-darwin** (`nix-darwin/`) - System-level macOS settings
- Entry: `nix-darwin/default.nix` → system modules
- Categories: `fonts/`, `homebrew/`, `launchd/`, `security/`, `system/`

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

Four overlays composed in `flake.nix` (applied in order):
1. `edgepkgs` - Bleeding-edge packages (claude-code, etc.)
2. `neovim-nightly-overlay` - Neovim nightly builds
3. `nur-packages` - Custom NUR packages (github:airRnot1106/nur-packages)
4. `./overlays` - Local package overlays

### Module Pattern

Each tool/package is a separate file with minimal configuration:
```nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [ package-name ];
}
```

Enable/disable features by adding/removing imports in category `default.nix` files.

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
nix run .#update-flake          # Update flake.lock
nix run .#update-home-manager   # Apply Home Manager only
nix run .#update-nix-darwin     # Apply nix-darwin only

# Manual with trace (for debugging)
nix run nixpkgs#home-manager -- switch --flake .#personal --show-trace --impure
darwin-rebuild switch --flake .#personal --show-trace --impure
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
1. Create `home/modules/<category>/<tool-name>.nix`:
   ```nix
   { pkgs, ... }:
   {
     home.packages = with pkgs; [ tool-name ];
   }
   ```
2. Import in `home/modules/<category>/default.nix`: `./tool-name.nix`
3. Run `nix fmt && nix flake check`

### Homebrew Cask (GUI apps)
1. Add to `nix-darwin/homebrew/casks/default.nix`
2. Run `nix run .#update-nix-darwin`

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

- `flake.nix` - Central orchestration, inputs/outputs, overlays
- `profile.nix` - User-specific settings (git, username)
- `home/default.nix` - Home Manager entry point
- `nix-darwin/default.nix` - System configuration entry point
- `nix/treefmt/default.nix` - Formatter configuration

## Task Completion Requirements

**ALWAYS run after any changes:**
```bash
nix fmt && nix flake check
```

This ensures code formatting (jsonfmt, kdlfmt, stylua, nixfmt) and validates configuration syntax.
