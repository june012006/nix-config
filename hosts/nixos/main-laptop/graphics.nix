{
  ...
}:
{
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    prime = {
      # sync.enable = true;
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:00:0";
      # offload = {
      #   enable = true;
      #   enableOffloadCmd = true;
      # };
    };
  };
  hardware.graphics = {
    enable = true;
  };
}
