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
    };
  };
}
