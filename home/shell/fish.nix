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
      # Pure-fish zoxide clone
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
    ];
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting
      # Use fish for nix shell
      nix-your-shell fish | source &
      # moar as pager
      set -x PAGER moar
      fish_add_path ~/.cargo/bin
      test -r ~/.local/src/kuber/kuber.completion.fish && \
        source ~/.local/src/kuber/kuber.completion.fish &
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
