{ pkgs, ... }:
{
  enable = true;
  package = pkgs.brave;
  commandLineArgs = [
    "--enable-features=UseOzonePlatform"
    "--ozone-platform=wayland"
  ];
}
