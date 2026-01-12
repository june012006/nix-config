#FIXME: Move attrs that will only work on linux to nixos.nix
{
  config,
  lib,
  pkgs,
  hostSpec,
  ...
}:
let
  platform = if hostSpec.isDarwin then "darwin" else "nixos";
in
{
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "modules/common/host-spec.nix"
      "modules/home"
    ])
    ./${platform}.nix

    # FIXME(starter): add/edit as desired
    ./bash.nix
    ./darwin.nix
    ./direnv.nix
    ./fonts.nix
    ./git.nix
    ./kitty.nix
    ./nixos.nix
    ./ssh.nix
  ];
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  programs.firefox.profiles.mail = {
    id = 0;
    name = "june012006";
    isDefault = true;
    settings = {
      "signon.rememberSignons" = false; # Disable built-in password manager
      "browser.compactmode.show" = true;
      "browser.uidensity" = 1; # enable compact mode
      "browser.aboutConfig.showWarning" = false;
      "browser.download.dir" = "${config.home.homeDirectory}/downloads";
      "browser.tabs.firefox-view" = true; # Sync tabs across devices
      "ui.systemUsesDarkTheme" = 1; # force dark theme
      "extensions.pocket.enabled" = false;
    };
  };
  inherit hostSpec;

  services.ssh-agent.enable = true;

  home = {
    username = lib.mkDefault config.hostSpec.username;
    homeDirectory = lib.mkDefault config.hostSpec.home;
    stateVersion = lib.mkDefault "24.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      FLAKE = "$HOME/src/nix/nix-config";
      SHELL = "bash";
    };
  };

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # FIXME(starter): add/edit as desired
      # Packages that don't have custom configs go here
      curl
      pciutils
      pfetch # system info
      pre-commit # git hooks
      p7zip # compression & encryption
      usbutils
      unzip # zip extraction
      unrar # rar extraction
      #vscode
      #vim
      ;
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
