{
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.alacritty;

  settings = {
    window = {
      padding = {
        x = 4;
        y = 8;
      };
      decorations = "none";
      opacity = 0.8;
      startup_mode = "Windowed";
      title = "Alacritty";
      dynamic_title = true;
      decorations_theme_variant = "None";
      dimensions = {
        columns = 140;
        lines = 40;
      };
    };

    general = {
      import = [
        pkgs.alacritty-theme.tokyo_night
      ];

      live_config_reload = true;
    };

    font =
      let
        jetbrainsMono = style: {
          family = "JetBrainsMono Nerd Font";
          inherit style;
        };
      in
      {
        size = 14;
        normal = jetbrainsMono "Regular";
        bold = jetbrainsMono "Bold";
        italic = jetbrainsMono "Italic";
        bold_italic = jetbrainsMono "Bold Italic";
      };

    mouse.hide_when_typing = true;

    cursor = {
      style = "Block";
    };

    env = {
      TERM = "xterm-256color";
    };
  };
}
