# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "stinkpad";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIDFjCCAf4CCQCOmehBEwv58DANBgkqhkiG9w0BAQsFADBNMQswCQYDVQQGEwJV
      UzEYMBYGA1UECgwPX0RldmVsb3BtZW50IENBMSQwIgYDVQQDDBtCQiBEZXZlbG9w
      bWVudCBjZXJ0aWZpY2F0ZXMwHhcNMjIwOTMwMTEyMTAzWhcNMzIwOTI3MTEyMTAz
      WjBNMQswCQYDVQQGEwJVUzEYMBYGA1UECgwPX0RldmVsb3BtZW50IENBMSQwIgYD
      VQQDDBtCQiBEZXZlbG9wbWVudCBjZXJ0aWZpY2F0ZXMwggEiMA0GCSqGSIb3DQEB
      AQUAA4IBDwAwggEKAoIBAQDDdaQhwgpdoGmwxpsdzh0aJfpwarIzbzqvuGVIlHE0
      R3/Nf+StA9OSRkisjGGcLf3exwtEBXE4CsB9cStRA4Go61+OW6sp8MCY3a8j44qi
      Lq/Kn+wjT7ulupFgW4d/PkBdWRReOqyPwps+GsLI3Q0tQ8qtTBcHztfCgn8lHmQN
      u1qgy/6of7qtc4eCPTHWZ8/Y/6miWy/DwaWOnj+g0S+AYYnLbt/nwiL4XVDAO0hM
      SVRiQ+eeYfEjGPpgjHbvQBEaWle3PD57qfnYZiwayA78R7r9kMX8syzGQYld/RW8
      R5DeD31dw0VVustfPyIs2SPHV7YFLXrt2/TTpHproSExAgMBAAEwDQYJKoZIhvcN
      AQELBQADggEBAHC6+3tyHyH+pO+wgB0IULKFeebA1f9EaLUrYPDw86Hmi5z1pNr1
      E0l/MQcUraIXK3/Thu4mc9hXH8QGhbBRcPo+gF3rxwIohDXWScX819PWj7XzWs3b
      OIzdTGmbpYvUoiIJS7kiCOi+/B5UJ0S2V8yRboJ9LCU5xerWo3dzxM7XcSKcaVD2
      276L4Er2PCTi2pNQt1AQLzQ0Aof2h3ceEfTxHjcyBKvoQhdE/ygXU1EWnJY9+BSm
      t27pEMBIaiZ4JoH42+mnjOy01ahwXv0iUh+48YA6q6/YRYNSr7xKyVk5CdifNfEf
      /kgh2rZmQpZazWCVLelwQM4y0+R76abmzRs=
      -----END CERTIFICATE-----
    ''
  ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [
          "hsp_hs"
          "hsp_ag"
          "hfp_hf"
          "hfp_ag"
        ];
      };
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robbin = {
    isNormalUser = true;
    description = "Robbin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  users.groups.docker.members = [ "robbin" ];

  # Install firefox.
  programs.firefox.enable = true;

  # Enable fish globally to enable completions provided by Nixpkgs
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = (
    with pkgs;
    [
      neovim
      wget
      git
      curl
    ]
  );
  # ++ [ inputs.dbeaver-last.legacyPackages.${pkgs.system}.pkgs.dbeaver-bin ];

  environment.variables.EDITOR = "nvim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Bluetooth GUI
  services.blueman.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
