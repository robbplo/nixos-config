{ inputs, ...}:
{
  imports = [ inputs.nixos-wsl.nixosModules.default ];

  # Enable WSL
  # https://nix-community.github.io/NixOS-WSL/options.html
  wsl = {
    enable = true;
    defaultUser = "robbin";
    # Add shortcuts for GUI applications to Windows start menu
    startMenuLaunchers = true;
  };
}
