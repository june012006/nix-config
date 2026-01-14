{ pkgs, ... }:
{
  hardware.onlykey.enable = true;
  nixpkgs.config.permittedInsecurePackages = [
    "python3.12-ecdsa-0.19.1"
    "python3.13-ecdsa-0.19.1"
  ];
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      onlykey
      onlykey-agent
      onlykey-cli
      ;
  };
}
