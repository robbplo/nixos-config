{
  lexical,
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    (with pkgs; [
      # utils
      yq-go
      nix-prefetch-git
      moar
      parallel
      neofetch
      # todo: add to wayland module
      # wl-mirror
      lsof
      tldr
      hyperfine

      # GUI
      google-chrome
      _1password-cli
      _1password-gui
      # todo: add to wayland module
      # spotifywm
      slack
      obsidian
      # todo: add to wayland module
      # spotifywm
      # webcord
      # wdisplays
      code-cursor

      # archives
      zip
      unzip
      p7zip

      # misc
      libnotify
      # todo: add to wayland module
      # inotify-tools
      xdg-utils

      # build tools
      gnumake
      automake
      autoconf
      just
      gcc
      ninja
      meson

      # cloud native
      docker-compose
      lazydocker
      kubectl
      kubectx
      kubelogin
      stern
      k9s
      openshift
      azure-cli
      awscli2
      rclone
      supabase-cli

      # javascript
      # nodejs
      # nodePackages.npm
      # nodePackages.pnpm
      bun
      yarn

      # elixir
      beam.packages.erlang_27.erlang
      beam.packages.erlang_27.elixir_1_17

      # snake_language
      python3

      # rust
      rustup

      # go
      go
      gopls

      # db related
      mysql84
      mycli
      pgcli
      sqlite
      redis
      clickhouse
    ])
    ++ [ lexical.packages.${pkgs.system}.default ]
    ++ (lib.optionals pkgs.stdenv.isLinux (with pkgs; [ wl-mirror ]));

  programs = {
    bat.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    zoxide.enable = true; # Cd to anywhere

    ssh.enable = true;
    aria2.enable = true;
  };
}
