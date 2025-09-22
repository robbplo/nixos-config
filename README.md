# nixos-config

This is my personal Nix configuration repository managing multiple machines across different platforms. It's intended for my own use and learning, though you're welcome to browse and steal ideas.

## Machines

- **smackbook** (macOS, aarch64-darwin) - MacBook using nix-darwin
- **stinkpad** (NixOS, x86_64-linux) - ThinkPad with Hyprland desktop
- **yeti-wsl** (NixOS WSL, x86_64-linux) - Windows Subsystem for Linux setup

## Structure

```
├── flake.nix              # Main flake configuration and inputs
├── Justfile              # Build commands and utilities
├── home/                 # Home Manager configurations
│   ├── ags/             # Aylur's GTK Shell (Linux desktop)
│   ├── hypr/            # Hyprland window manager config
│   ├── nvim/            # Neovim configuration
│   ├── programs/        # Common programs (git, direnv, ssh)
│   ├── shell/           # Shell configuration (fish, kitty)
│   ├── wofi/            # Application launcher for Hyprland
│   └── fonts/           # Font configurations
├── modules/
│   ├── hosts/           # Host-specific configurations
│   └── shared/          # Shared modules for darwin/nixos
└── todo.md              # Personal todo list
```

## Key Features

- **Cross-platform**: Supports both macOS (nix-darwin) and NixOS
- **Hyprland desktop**: Complete Wayland desktop setup with AGS, wofi, and custom scripts
- **Development environment**: Comprehensive Neovim setup with LSPs and formatters
- **Home Manager**: Declarative user environment management
- **Flakes**: Modern Nix flakes for reproducible builds

## Usage

Built with [just](https://github.com/casey/just) for convenience:

```bash
# Build and switch (auto-detects platform)
just rebuild

# Update flake inputs
just up

# Clean old generations
just clean && just gc

# View system history
just history
```

## Notes

This configuration is opinionated and tailored to my workflow. It includes:
- Fish shell with custom configurations
- Neovim with extensive LSP setup for multiple languages
- Hyprland on Linux with custom keybindings and aesthetics
- macOS-specific optimizations on the MacBook
