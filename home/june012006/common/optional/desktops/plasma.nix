{ inputs, ... }:
{
  imports = [
    #plasma-manager/modules>
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  programs = {
    plasma = {
      enable = true;
      # etc.

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
    };
  };
}
