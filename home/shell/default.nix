{ config, pkgs, ... }:

{
  # Bash is the login shell, runs fish when starting in interactive mode.
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # Fish shell, because bash is weird
  programs.fish = {
    enable = true;
    plugins = [
      # Git aliases
      {
        name = "gitnow";
        src = builtins.fetchGit {
          url = "https://github.com/joseluisq/gitnow.git";
          ref = "HEAD";
          rev = "91bda1d0ffad2d68b21a1349f9b55a8cb5b54f35";
        };
      }
      # Nice prompt, needs runtime config though
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      # Pure-fish zoxide clone
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      # Colorizer for common commands
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAbbrs = {
      ga = "git add";
      gc = "git commit";
      gcm = "git commit -m";
      gcam = "git commit -am";
      gcmm = "git commit --amend";
      gcamm = "git commit -a --amend";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gm = "git merge";
      nah = "git reset --hard";
      mr = "glab mr view -w";
      pr = "gh pr checkout";

      ## Programs
      sail = "bash vendor/bin/sail";
      art = "bash vendor/bin/sail artisan";
      doco = "docker-compose";

      ## Utility
      paste = "wl-paste";
      p = "wl-paste";
      copy = "wl-copy";
      c = "wl-copy";
      startags = "hyprctl dispatch exec /home/robbin/.config/hypr/scripts/start_ags";
      hyx = "hyprctl dispatch exec --";
      rb = "sudo nixos-rebuild switch --flake ~/nixos-config#stinkpad --show-trace";
    };
  };

  # Kitty terminal
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Cartograph CF Regular";
      bold_font = "Cartograph CF Bold";
      italic_font = "Cartograph CF Regular Italic";
      bold_italic_font = "Cartograph CF Bold Italic";

      font_size = "14.0";
      cursor_shape = "block";
      copy_on_select = "yes";
      window_padding_width = "0";
      hide_window_decorations = "yes";
      confirm_os_window_close = "0";

      # Color scheme
      ## name: Tokyo Night Moon
      ## license: MIT
      ## author: Folke Lemaitre
      ## upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/kitty/tokyonight_moon.conf
      background = "#222436";
      foreground = "#c8d3f5";
      selection_background = "#3654a7";
      selection_foreground = "#c8d3f5";
      url_color = "#4fd6be";
      cursor = "#c8d3f5";
      cursor_text_color = "#222436";

      # Tabs
      active_tab_background = "#82aaff";
      active_tab_foreground = "#1e2030";
      inactive_tab_background = "#2f334d";
      inactive_tab_foreground = "#545c7e";
      #tab_bar_background #1b1d2b

      # Windows
      active_border_color = "#82aaff";
      inactive_border_color = "#2f334d";

      # normal
      color0 = "#1b1d2b";
      color1 = "#ff757f";
      color2 = "#c3e88d";
      color3 = "#ffc777";
      color4 = "#82aaff";
      color5 = "#c099ff";
      color6 = "#86e1fc";
      color7 = "#828bb8";

      # bright
      color8 = "#444a73";
      color9 = "#ff757f";
      color10 = "#c3e88d";
      color11 = "#ffc777";
      color12 = "#82aaff";
      color13 = "#c099ff";
      color14 = "#86e1fc";
      color15 = "#c8d3f5";

      # extended colors
      color16 = "#ff966c";
      color17 = "#c53b53";

      background_opacity = "0.5";
      linux_display_server = "Wayland";
      # do not ask to sanitize pasted input
      paste_actions = "quote-urls-at-prompt";
      # 10mb scrollback size, stored in RAM. Should allow 100k lines
      scrollback_pager_history_size = "10";
    };
    keybindings = {
      # unmap new tab creation
      "kitty_mod+t" = "no_op";
      "cmd+t" = "no_op";
    };
  };
}
