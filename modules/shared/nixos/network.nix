{ pkgs, ... }:
{
  # Enable NetworkManager
  networking.networkmanager = {
    enable = true;
    dns = "dnsmasq";
  };

  environment.systemPackages = [ pkgs.networkmanagerapplet ];

  # Disable ipv6
  networking.enableIPv6 = false;
}
