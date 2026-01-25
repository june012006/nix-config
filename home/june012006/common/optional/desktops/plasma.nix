{ inputs, ... }:
{
  imports = [
    #plasma-manager/modules>
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  programs = {
    plasma = {
      enable = true;
      immutableByDefault = true;
      # etc.
      workspace = {
        # Sets the Global Theme to Breeze Dark
        lookAndFeel = "org.kde.breezedark.desktop";

        # Ensures the color scheme matches (standard in Plasma 6)
        colorScheme = "BreezeDark";

        # Optional: Set the theme of the desktop panels specifically
        theme = "breeze-dark";
        # Set Accent Color (Royal Purple)
        # Unavailable in current version, set in configFile
        # accentColor = "#4b005ecb";
      };
      kwin = {
        nightLight = {
          enable = true;
          mode = "location";
          location = {
            latitude = "32.75"; # Fort Worth, TX example
            longitude = "-97.33";
          };
        };
      };
      #Keyboard, Mouse, Touchpad
      input = {
        keyboard = {
          numlockOnStartup = "on";
        };
      };
      #power settings
      powerdevil = {
        AC = {
          dimKeyboard.enable = false;
          dimDisplay.enable = false;
          autoSuspend.action = "nothing";
          displayBrightness = 100;
          keyboardBrightness = 100;
          powerProfile = "performance";
          whenLaptopLidClosed = "doNothing";

        };
        battery = {
          dimKeyboard.enable = true;
          dimDisplay.enable = true;
          autoSuspend.action = "sleep";
          displayBrightness = 75;
          keyboardBrightness = 75;
          powerProfile = "balanced";
          whenLaptopLidClosed = "doNothing";
        };
        lowBattery = {
          dimKeyboard.enable = true;
          dimDisplay.enable = true;
          autoSuspend.action = "sleep";
          displayBrightness = 60;
          keyboardBrightness = 60;
          powerProfile = "powerSaving";
          whenLaptopLidClosed = "doNothing";
        };
        batteryLevels = {
          criticalLevel = 10;
          lowLevel = 35;
          criticalAction = "shutDown";
        };
      };
      configFile."kdeglobals"."General" = {
        # Use the specific key name 'AccentColor'
        # Format: R,G,B (e.g., "#7aa2f7" is approx 122,162,247)
        "AccentColor" = "75,0,94";

        # Ensure Plasma doesn't override your choice with the wallpaper color
        "accentColorFromWallpaper" = false;
      };
    };
  };
}
