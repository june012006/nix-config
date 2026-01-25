{
  pkgs,
  lib,
  ...
}:
{
  #Update to latest kernel.   May need to pin later if issues arise
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    systemd-boot = {
      enable = true;
      # When using plymouth, initrd can expand by a lot each time, so limit how many we keep around
      configurationLimit = lib.mkDefault 10;
    };
    efi.canTouchEfiVariables = true;
    timeout = 3;
  };

  boot.initrd = {
    systemd.enable = true;
  };
}
