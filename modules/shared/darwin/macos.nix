{
  # Add capability to use TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "robbin";
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
      nonUS.remapTilde = true;
    };
  };

  system.defaults = {
    dock = {
      # Dock
      appswitcher-all-displays = true;
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.15;
      orientation = "bottom";
      tilesize = 48;
      launchanim = false;
      minimize-to-application = true;
      show-process-indicators = true;
      show-recents = false;
      showhidden = false;
      static-only = false;
      mineffect = "scale";
      dashboard-in-overlay = false;
      expose-animation-duration = 0.2;
      expose-group-apps = true;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      mru-spaces = false;
      persistent-apps = [ ];
    };

    finder = {
      _FXShowPosixPathInTitle = false;
      _FXSortFoldersFirst = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = false;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      QuitMenuItem = false;
      ShowPathbar = true;
      ShowStatusBar = false;
    };

    NSGlobalDomain = {
      AppleICUForce24HourTime = false;
      AppleInterfaceStyle = "Dark";
      AppleScrollerPagingBehavior = true;
      AppleShowAllExtensions = true;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSWindowShouldDragOnGesture = true;
      KeyRepeat = 2;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.swipescrolldirection" = true;
    };
  };
}
