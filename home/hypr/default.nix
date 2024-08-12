{ pkgs,  ... }:
{
  home.packages = with pkgs; [
    hyprlock
    hyprpaper
    hypridle
    wlogout
  ];

  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png;

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/startup.conf".source = ./startup.conf;

  home.file.".config/hypr/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  # "Xcursor.size" = 16;
  # "Xft.dpi" = 192;
  # };

}
