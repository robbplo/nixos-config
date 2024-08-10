{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    ags.url = "github:Aylur/ags";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ... 
  }: {
    nixosConfigurations = {
      stinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/stinkpad
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

	    home-manager.extraSpecialArgs = inputs;
            home-manager.users.robbin = import ./home;
          }
        ];
      };
    };
  };
}
