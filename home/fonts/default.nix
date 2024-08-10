{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  xdg.dataFile."fonts/Cartograph" = {
    source = ./Cartograph;
    recursive = true;
  };

  home.packages = with pkgs; [
    nerdfonts
  ];

}
