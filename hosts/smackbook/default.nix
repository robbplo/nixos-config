{ pkgs, ... }:
{
  imports = [ ./home.nix ];

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

  # Add ability to use TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users.robbin = {
    shell = pkgs.bashInteractive;
    name = "robbin";
    home = "/Users/robbin";
  };

  system.primaryUser = "robbin";
  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = false;
      AppleInterfaceStyle = "Dark";
      AppleScrollerPagingBehavior = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSWindowShouldDragOnGesture = true;
      KeyRepeat = 2;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.swipescrolldirection" = true;
    };
  };

  system.stateVersion = 5;
}
