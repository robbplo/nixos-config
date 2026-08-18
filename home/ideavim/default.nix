{ config, ... }:

{
  home.file.".ideavimrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/ideavim/ideavimrc";
}
