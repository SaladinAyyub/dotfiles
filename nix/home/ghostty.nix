{
  pkgs,
  ...
}:
{
  enable = true;
  enableZshIntegration = true;
  settings = {
    theme = "tokyonight";
    font-size = 14;
    window-decoration = false;
    gtk-titlebar = false;
    window-width = 140;
    window-height = 40;
    window-padding-x = 5;
    window-padding-y = 5;
    window-save-state = "always";
    background-opacity = 0.8;
  };
}
