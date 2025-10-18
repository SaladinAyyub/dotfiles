{
  pkgs,
  config,
  lib,
  ...
}:

let
  # Packages the script relies on
  scriptDependencies = with pkgs; [
    neovim
    jq
    xdotool
    bash
  ];

  iconPath = ./assets/nvimunity.png;

  nvimunityIconPkg = pkgs.runCommand "nvimunity-icon" { } ''
    # Create the required hicolor directory structure in the output
    ICON_DIR=$out/share/icons/hicolor/512x512/apps
    mkdir -p $ICON_DIR

    # Copy the icon file from the source to the correct location.
    # The icon file name (nvimunity.svg) must match the 'Icon' field below.
    cp ${iconPath} $ICON_DIR/nvimunity.svg
  '';

  # 1. Define the NvimUnity Script
  nvimunityScript = pkgs.writeShellScriptBin "nvimunity" ''
    #!/usr/bin/env bash

    # Use explicit, Nix-managed paths for core dependencies
    NVIM_PATH="${pkgs.neovim}/bin/nvim"
    JQ_PATH="${pkgs.jq}/bin/jq"
    XDOTOL_PATH="${pkgs.xdotool}/bin/xdotool"

    CONFIG_DIR="$HOME/.config/nvim-unity"
    CONFIG_FILE="$CONFIG_DIR/config.json"
    SOCKET="$HOME/.cache/nvimunity.sock"

    mkdir -p "$CONFIG_DIR"

    # Create config.json if it doesn't exist
    if [ ! -f "$CONFIG_FILE" ]; then
      echo '{"last_project": ""}' | "''${JQ_PATH}" . > "$CONFIG_FILE"
    fi

    # Read last_project
    LAST_PROJECT=$("''${JQ_PATH}" -r '.last_project' "$CONFIG_FILE")

    # Arguments
    FILE="$1"
    LINE="${"2:-1"}"

    if ! [[ "$LINE" =~ ^[1-9][0-9]*$ ]]; then
      LINE="1"
    fi

    # Detect Shift pressed (optional with xdotool)
    SHIFT_PRESSED=false
    if command -v "''${XDOTOL_PATH}" >/dev/null; then
      "''${XDOTOL_PATH}" keydown Shift_L keyup Shift_L >/dev/null 2>&1 && SHIFT_PRESSED=true
    fi

    # Mount command
    if [ "$SHIFT_PRESSED" = true ] && [ -n "$LAST_PROJECT" ]; then
      CMD="$NVIM_PATH --listen $SOCKET \"+$LINE\" \"+cd \"$LAST_PROJECT\"\" $FILE"
    else
      CMD="$NVIM_PATH --listen $SOCKET \"+$LINE\" $FILE"
    fi

    # Execute
    eval $CMD
  '';
in
{
  # 2. Add dependencies and the script to the user's PATH
  home.packages = scriptDependencies ++ [
    nvimunityScript
    nvimunityIconPkg
    pkgs.ghostty
  ];

  # 3. Define the Desktop Entry
  xdg.desktopEntries.nvimunity = {
    name = "NvimUnity";
    comment = "Bridge between Unity and Neovim";
    # The 'exec' attribute uses the full path to the installed script
    exec = "${pkgs.ghostty}/bin/ghostty -e ${nvimunityScript}/bin/nvimunity %f";
    icon = "nvimunity";
    terminal = false;
    type = "Application";
    categories = [
      "Development"
      "Utility"
    ];
    startupNotify = false;
  };
  home.file.".local/bin/nvimunity".source =
    config.lib.file.mkOutOfStoreSymlink "/etc/profiles/per-user/saladin/bin/nvimunity";
}
