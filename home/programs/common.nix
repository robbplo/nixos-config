{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    yq-go # https://github.com/mikefarah/yq
    nix-prefetch-git

    # misc
    libnotify
    xdg-utils
    grc
    lsof
    sqlite

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

    # javascript
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    bun
    yarn

    # snake_language
    python3

    # rust
    rustc
    cargo

    # db related
    #dbeaver-bin
    mycli
    pgcli

    google-chrome
    _1password
    _1password-gui
    slack
    obsidian
    wofi
    godot_4
    webcord
    beekeeper-studio
  ];

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

  services = {
    # syncthing.enable = true;

    # auto mount usb drives
    # udiskie.enable = true;
  };
}
