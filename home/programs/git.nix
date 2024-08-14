{ pkgs, ... }:
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
  };

  home.file.".gitconfig".source = ./.gitconfig;
}
