{ pkgs, ... }:

let
  godot_43 = pkgs.godot_4.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "godotengine";
      repo = "godot";
      rev = "77dcf97d82cbfe4e4615475fa52ca03da645dbd8";
      hash = "sha256-v2lBD3GEL8CoIwBl3UoLam0dJxkLGX0oneH6DiWkEsM=";
    };
  });
in
{
  home.packages =
    (with pkgs; [
      # utils
      yq-go # https://github.com/mikefarah/yq
      nix-prefetch-git
      moar
      ov

      # GUI
      google-chrome
      # dbeaver-bin
      _1password
      _1password-gui
      slack
      obsidian
      webcord
      beekeeper-studio
      wofi

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
      mysql84
      mysql-shell
      mycli
      pgcli

    ])
    ++ [ godot_43 ];

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
