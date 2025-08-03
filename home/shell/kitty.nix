{
  # home.file.".config/kitty/kitty.conf".text = kittyConf;
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
      # todo: yes on linux, titlebar-only on macos
      # hide_window_decorations = "yes";
      hide_window_decorations = "titlebar-only";
      confirm_os_window_close = "0";

      ## name: srcery
      ## author: Daniel Berg
      ## license: MIT
      ## upstream: https://github.com/srcery-colors/srcery-terminal/
      ## blurb: Srcery is a color scheme with clearly defined contrasting colors and
      ## a slightly earthy tone.
      foreground = "#fce8c3";
      background = "#1c1b19";
      selection_foreground = "#1c1b19";
      selection_background = "#fce8c3";
      # url_color = "#4fd6be";
      cursor = "#fbb829";
      cursor_text_color = "background";

      # Tabs
      active_tab_background = "#82aaff";
      active_tab_foreground = "#1e2030";
      inactive_tab_background = "#2f334d";
      inactive_tab_foreground = "#545c7e";

      #: black
      color0 = "#1c1b19";
      color8 = "#918175";

      #: red
      color1 = "#ef2f27";
      color9 = "#f75341";

      #: green
      color2 = "#519f50";
      color10 = "#98bc37";

      #: yellow
      color3 = "#fbb829";
      color11 = "#fed06e";

      #: blue
      color4 = "#2c78bf";
      color12 = "#68a8e4";

      #: magenta
      color5 = "#e02c6d";
      color13 = "#ff5c8f";

      #: cyan
      color6 = "#0aaeb3";
      color14 = "#2be4d0";

      #: white
      color7 = "#baa67f";
      color15 = "#fce8c3";

      allow_remote_control = "password";
      remote_control_password = "waterval";

      linux_display_server = "Wayland";
      # do not ask to sanitize pasted input
      paste_actions = "quote-urls-at-prompt";
      # 10mb scrollback size, stored in RAM. Should allow 100k lines
      scrollback_pager_history_size = "10";

      macos_option_as_alt = "yes";
    };
    keybindings = {
      # unmap new tab creation
      "kitty_mod+t" = "no_op";
      "cmd+t" = "no_op";
    };
  };
}
