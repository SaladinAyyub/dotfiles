{
  pkgs,
  ...
}: {
  enable = true;
  package = pkgs.vscode.fhs;
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    danielgavin.ols
    ms-python.python
    charliermarsh.ruff
    enkia.tokyo-night
  ];
  userSettings = {
    "files.autoSave" = "off";
    "telemetry.telemetryLevel" = "off";
  };
}
