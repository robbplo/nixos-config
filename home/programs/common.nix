{ pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # utils
      yq-go # https://github.com/mikefarah/yq
      nix-prefetch-git
      moar
      ov
      parallel

      # GUI
      google-chrome
      # dbeaver-bin
      _1password
      _1password-gui
      spotifywm
      slack
      obsidian
      webcord
      beekeeper-studio
      wofi
      godot_4

      # archives
      zip
      unzip
      p7zip

      # misc
      libnotify
      xdg-utils
      grc
      lsof
      sqlite
      inotify-tools
      neofetch

      # build tools
      gnumake
      automake
      autoconf
      just
      gcc
      ninja
      meson
      mise

      # cloud native
      docker-compose
      lazydocker
      kubectl
      kubectx
      kubelogin
      azure-cli
      openshift
      stern
      k9s

      # javascript
      nodejs
      nodePackages.npm
      nodePackages.pnpm
      bun
      yarn

      # elixir
      beam.packages.erlang_27.erlang
      beam.packages.erlang_27.elixir_1_17
      beam.packages.erlang_27.elixir-ls

      # snake_language
      python3

      # rust
      rustc
      cargo

      # db related
      mysql84
      mysql-shell
      mycli
      pgcli

    ]);

  programs = {
    bat.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor

    ssh.enable = true;
    aria2.enable = true;
  };
}
