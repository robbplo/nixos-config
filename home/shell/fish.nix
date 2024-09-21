{ pkgs, ... }:

{
  home.packages = [ pkgs.nix-your-shell ];
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
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      # Pure-fish zoxide clone
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      # Colorizer for common commands
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      # Run bash commands directly from fish
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
    ];
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting
      # Use fish for nix shell
      nix-your-shell fish | source
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
      rb = "just -f ~/nixos-config/Justfile";
      k = "kubectl";
      lzd = "lazydocker";
      ssh = "kitten ssh";
    };
  };
}
