{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = { };
    extraConfig = (builtins.readFile ./ssh.config);
  };
}
