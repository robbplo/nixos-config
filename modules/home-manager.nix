{ inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.robbin = import ../home;
  home-manager.extraSpecialArgs = inputs;
}
