{ pkgs, ...}:
{
  # Enable NetworkManager
  networking.networkmanager = {
    enable = true;
    dns = "dnsmasq";
  };

  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];

  # Disable ipv6
  networking.enableIPv6 = false;

  # Setup docker tld for Ubunty
  environment.etc = {
    "NetworkManager/dnsmasq.d/00-ubunty.conf" = {
      text = "address=/docker/172.16.0.1";
      mode = "0440";
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ 53 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
