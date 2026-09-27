{ pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./kitty.nix
  ];
  # Bash is the login shell, runs fish when starting in interactive mode.
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      if [[ $(ps -p $PPID -o comm=) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
