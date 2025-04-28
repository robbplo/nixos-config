{ pkgs, ... }:
{

  home.packages = [ pkgs.wofi ];
  home.file.".config/wofi/style.css".source = ./style.css;

}
