{
  # Allow unfree packages in nixos configuration
  nixpkgs.config.allowUnfree = true;
  # Allow the same in the cli
  # Still requires the use of the `--impure` flag
  environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.optimise.automatic = true;
}
