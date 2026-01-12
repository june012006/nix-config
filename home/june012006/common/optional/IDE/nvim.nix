{
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    #extraConfig = builtins.readFile .neovim.conf   #copied from another place, no current config file, but saving nonetheless
  };
}
