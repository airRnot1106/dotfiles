# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository built with Nix Flakes for macOS development environments. It uses:
- **Home Manager** for user environment configuration
- **nix-darwin** for macOS system configuration
- **Nix Flakes** for reproducible builds and dependency management

## Architecture

The configuration is split into two main parts:

### Home Manager Configuration (`home/`)
- **User-level packages and configurations** (development tools, editors, shell)
- Entry point: `home/default.nix`
- Modules organized by category: `dev/`, `editor/`, `git/`, `shell/`, `util/`
- Environment variables configured via `home/options.nix` using system environment

### nix-darwin Configuration (`nix-darwin/`)
- **System-level macOS settings** (dock, finder, security, services)
- Entry point: `nix-darwin/default.nix`
- Includes Homebrew casks and Mac App Store apps

## Common Commands

### Initial Setup
```bash
USER="YOUR_NAME" \
GIT_USERNAME="YOUR_GIT_NAME" \
GIT_EMAIL="mail@example.com" \
OPENAI_KEY="YOUR_API_KEY" \
nix run
```

### Apply Configuration Changes
```bash
# Update flake inputs, home-manager, and nix-darwin
nix run

# Apply only home-manager changes
nix run nixpkgs#home-manager -- switch --flake .#personal --show-trace --impure

# Apply only nix-darwin changes
darwin-rebuild switch --flake .#personal --show-trace --impure
```

### Development
```bash
# Enter development shell
nix develop

# Format code
nix fmt

# Check formatting
nix flake check
```

## Configuration Structure

- **Development tools**: `home/modules/dev/` (languages, LSPs, tools)
- **Editor configs**: `home/modules/editor/` (Neovim, VS Code)
- **Shell setup**: `home/modules/shell/` (Zsh, terminal emulator, multiplexer)
- **System settings**: `nix-darwin/system/` (dock, finder, keyboard, trackpad)
- **Package management**: `nix-darwin/homebrew/` for GUI apps not in nixpkgs

The modular structure allows enabling/disabling features by adding/removing imports in the respective `default.nix` files.

## Important: Task Completion Requirements

**ALWAYS run these commands after completing any task:**
```bash
# Format code
nix fmt

# Check formatting and validate configuration
nix flake check
```

These commands are mandatory for ensuring code quality and configuration validity.
