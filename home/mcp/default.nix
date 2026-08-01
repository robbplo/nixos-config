{ config, ... }:

{
  home.file.".config/mcp/mcp.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/mcp/mcp.json";
}
