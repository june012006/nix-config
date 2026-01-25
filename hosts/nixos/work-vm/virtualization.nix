{ inputs, ... }:
{
  imports = [ inputs.impermanence.nixosModules.impermanence ];
  virtualisation.vmVariant = {
    # 1. Import the impermanence module for the VM specifically

    virtualisation.memorySize = 8096;
    # 2. Use tmpfs for root so everything is in RAM and lost on reboot
    fileSystems."/" = {
      device = "none";
      fsType = "tmpfs";
      options = [
        "size=4G"
        "mode=755"
      ];
    };

    # 3. Explicitly persist only what Citrix needs (like licenses or tokens)
    # This requires a separate disk to be mounted at /persist
    # environment.persistence."/persist" = {
    #   directories = [
    #     "/var/lib/citrix"
    #     "/home/june012006/.ICAClient"
    #   ];
    # };
  };
}
