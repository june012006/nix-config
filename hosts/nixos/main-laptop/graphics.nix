{
  config,
  #pkgs,
  ...
}:
{
  programs.nix-ld.enable = true;
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
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
  nix.settings = {
    substituters = [ "https://cache.nixos-cuda.org" ];
    trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
  };
}
