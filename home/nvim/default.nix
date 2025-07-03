{ pkgs, config, ... }:

{
  programs.fzf.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      # Language servers
      bash-language-server
      typescript-language-server
      vscode-langservers-extracted # HTML, CSS, JSON, ESlint
      rust-analyzer
      yaml-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      lua-language-server
      gopls
      nixd
      haskell-language-server

      # Formatters
      nixfmt-rfc-style
      biome
      shfmt
      stylelint
      stylua
    ];
  };
  home.file.".config/nvim/init.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/nvim/init.lua";
  home.file.".config/nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/nvim/lua";
    recursive = true;
  };
  home.file.".config/nvim/after" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/nvim/after";
    recursive = true;
  };
}
