{
  programs.ssh = {
    enable = true;
    extraConfig = (builtins.readFile ./ssh.config);
  };
}
