{ pkgs, ... }:

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
    extraConfig = ''
      luafile ${./lua/packer_init.lua}

      luafile ${./lua/core/autocmds.lua}
      luafile ${./lua/core/colors.lua}
      luafile ${./lua/core/options.lua}
      luafile ${./lua/core/keymap.lua}

      luafile ${./lua/plugins/barbar.lua}
      luafile ${./lua/plugins/debugger.lua}
      luafile ${./lua/plugins/gitsigns.lua}
      luafile ${./lua/plugins/godot.lua}
      luafile ${./lua/plugins/indent-blankline.lua}
      luafile ${./lua/plugins/lualine.lua}
      luafile ${./lua/plugins/neovide.lua}
      luafile ${./lua/plugins/nvim-cmp.lua}
      luafile ${./lua/plugins/nvim-lspconfig.lua}
      luafile ${./lua/plugins/nvim-telescope.lua}
      luafile ${./lua/plugins/nvim-treesitter.lua}
      luafile ${./lua/plugins/oil.lua}
      luafile ${./lua/plugins/trouble.lua}
    '';
  };
}
