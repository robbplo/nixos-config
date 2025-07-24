{ inputs, ... }:
{
  imports = [ inputs.home-manager.darwinModules.default ];

  home-manager = {
    sharedModules = [ inputs.mac-app-util.homeManagerModules.default ];
    useGlobalPkgs = true;
    useUserPackages = true;
    users.robbin = import ../../home/darwin.nix;
    extraSpecialArgs = inputs;
  };
}
