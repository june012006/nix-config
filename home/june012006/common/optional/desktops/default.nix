{ pkgs, ... }:
{
  imports = [
    # Packages with custom configs go here

    ########## Utilities ##########
    #./gtk.nix
    ./plasma.nix
  ];
  home.packages = [
    pkgs.pavucontrol # gui for pulseaudio server and volume controls
    pkgs.galculator # gtk based calculator
  ];
}
