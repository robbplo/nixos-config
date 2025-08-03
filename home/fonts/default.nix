{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  xdg.dataFile."fonts/Cartograph" = {
    source = ./Cartograph;
    recursive = true;
  };

  home.file."Library/Fonts/HomeManager/Cartograph" = {
    source = ./Cartograph;
    recursive = true;
  };
}
