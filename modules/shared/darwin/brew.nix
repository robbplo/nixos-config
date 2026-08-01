{ config, lib, ... }:

{
  system.activationScripts.homebrew.text = lib.mkBefore ''
    # Homebrew 6 requires explicit trust for third-party taps.
    if [ -x "${config.homebrew.brewPrefix}/brew" ]; then
      echo >&2 "Trusting third-party Homebrew taps..."
      sudo --user=${lib.escapeShellArg config.homebrew.user} --set-home \
        "${config.homebrew.brewPrefix}/brew" trust felixkratz/formulae supabase/tap
    fi
  '';

  homebrew = {
    enable = true;

    taps = [
      "felixkratz/formulae"
      "supabase/tap"
    ];

    brews = [
      "dnsmasq"
      "felixkratz/formulae/borders"
      "felixkratz/formulae/sketchybar"
      "supabase/tap/supabase"
      "uv"
      "ruff"
      "flake8"
      "mypy"
      "node@20"
    ];

    casks = [
      "1password"
      "ableton-live-intro@11"
      "aerospace"
      "cursor"
      "discord"
      "google-chrome"
      "karabiner-elements"
      "lm-studio"
      "logi-options+"
      "nikitabobko/tap/aerospace"
      "obsidian"
      "orbstack"
      "raycast"
      "slack"
      "spotify"
      "utm"
    ];
  };
}
