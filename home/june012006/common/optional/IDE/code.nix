{
  pkgs,
  ...
}:
{
  programs.vscode.enable = true;
  # Optional: Add extensions declaratively
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide # Adds Nix language support
    ms-python.python
  ];
}
