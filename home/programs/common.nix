{ lexical, pkgs, ... }:
{
  home.packages =
    (with pkgs; [
      # utils
      yq-go
      nix-prefetch-git
      moar
      parallel
      neofetch
      wl-mirror
      lsof
      tldr
      hyperfine

      # GUI
      google-chrome
      _1password-cli
      _1password-gui
      spotifywm
      slack
      obsidian
      webcord
      wdisplays
      code-cursor

      # archives
      zip
      unzip
      p7zip

      # misc
      libnotify
      inotify-tools
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

      # javascript
      nodejs
      nodePackages.npm
      nodePackages.pnpm
      bun
      yarn

      # elixir
      beam.packages.erlang_27.erlang
      beam.packages.erlang_27.elixir_1_17

      # snake_language
      python3

      # rust
      rustup

      # db related
      mysql84
      mysql-shell
      mycli
      pgcli
      sqlite
      redis
      clickhouse
    ])
    ++ [ lexical.packages.${pkgs.system}.default ];

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
