{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    gh
    glab
    delta
  ];

  programs.git = {
    enable = true;
    userName = "Robbin Ploeger";
    userEmail = "robbplo@gmail.com";
    ignores = [
      ".worktrees/"
    ];
  };

  home.file.".gitconfig".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/programs/.gitconfig";
}
