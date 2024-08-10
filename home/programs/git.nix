{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gh
    glab
  ];

  # todo configure betty git
  programs.git = {
    enable = true;

    userName = "Robbin Ploeger";
    userEmail = "robbplo@gmail.com";
  };
}
