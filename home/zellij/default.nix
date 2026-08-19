{ config, ... }:

{
  home.file.".config/zellij/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/zellij/config.kdl";
}
