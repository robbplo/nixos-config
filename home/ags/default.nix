{ ags, pkgs, ... }:

{

  imports = [ ags.homeManagerModules.default ];

  home.packages = with pkgs; [
    bun
    dart-sass
    brightnessctl
    swww
    slurp
    wf-recorder
    wl-clipboard
    wayshot
    swappy
    hyprpicker
    pavucontrol
    networkmanager
    gtk3
  ];

  programs.ags = {
    enable = true;

    configDir = ./config;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

}
