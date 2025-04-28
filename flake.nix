{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    ags.url = "github:Aylur/ags/60180a184cfb32b61a1d871c058b31a3b9b0743d";
    # dbeaver-last.url = "github:nixos/nixpkgs/4d10225ee46c0ab16332a2450b493e0277d1741a";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    lexical.url = "github:lexical-lsp/lexical";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        stinkpad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/stinkpad

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
