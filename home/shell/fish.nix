{ pkgs, ... }:

{
  home.packages = [ pkgs.nix-your-shell ];
  programs.fish = {
    enable = true;
    plugins = [
      # Nice prompt, needs imperative config though
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    interactiveShellInit = ''
      # disable greeting
      set fish_greeting

      # paths
      fish_add_path ~/.cargo/bin
      fish_add_path ~/.bun/bin
      fish_add_path /opt/homebrew/bin

      # use fish for nix shell
      nix-your-shell fish | source &

      # moar as pager
      set -x PAGER moar

      # kuber completions because i'm too lazy to make a proper nix module
      # larger memory for zoxide
      set -x _ZO_MAXAGE 100000
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
      hyx = "hyprctl dispatch exec --";
      k = "kubectl";
      lzd = "lazydocker";
    };
  };
  home.file.".config/fish/functions" = {
    source = ./fish_functions;
    recursive = true;
  };
  home.file.".config/fish/completions/wash.fish".source = ./fish_completions/wash.fish;
}
