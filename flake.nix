{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Linux desktop things
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    ags.url = "github:Aylur/ags/60180a184cfb32b61a1d871c058b31a3b9b0743d";

    # Run dynamic binaries on NixOS
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    # MacOS
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # Fix an issue where home-manager apps are not indexed on Spotlight
    mac-app-util.url = "github:hraban/mac-app-util";
    mac-app-util.inputs.nixpkgs.follows = "nixpkgs";

    # Run NixOS in WSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # Elixir language server
    lexical.url = "github:lexical-lsp/lexical";
  };

  outputs =
    inputs@{
      nixpkgs,
      nix-ld,
      nix-darwin,
      ...
    }:
    let
      system = "aarch64-darwin";
    in
    {
      darwinConfigurations = {
        smackbook = nix-darwin.lib.darwinSystem {
          system = system;
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./hosts/smackbook
          ];
        };
      };
      nixosConfigurations = {
        stinkpad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/stinkpad
            nix-ld.nixosModules.nix-ld
            { programs.nix-ld.dev.enable = true; }

            ./modules/desktop.nix
            ./modules/home-manager.nix
            ./modules/hyprland.nix
            ./modules/network.nix
            ./modules/nixpkgs.nix
          ];
        };
        yeti-wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/yeti-wsl

            ./modules/network.nix
            ./modules/nixpkgs.nix
            ./modules/wsl.nix
            ./modules/home-manager.nix
          ];
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
