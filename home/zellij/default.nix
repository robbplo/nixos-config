{ config, ... }:

{
  home.file.".pi/agent/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/pi/settings.json";

  home.file.".pi/agent/extensions" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/pi/extensions";
    recursive = true;
  };
}
