{ pkgs, ... }:
{
  imports = [
    ./home.nix
  ];

  networking.hostName = "smackbook";

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    optimise.automatic = true;
  };

  nixpkgs = {
    hostPlatform.system = "aarch64-darwin";

    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
  environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

  programs.fish.enable = true;
  users.users.robbin = {
    shell = pkgs.fish;
    name = "robbin";
    home = "/Users/robbin";
  };


  system.stateVersion = 5;
}
