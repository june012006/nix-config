{ pkgs, ... }:
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "june012006" ]; # FIXME replace with name variable
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      virt-viewer
      ;
  };
}
