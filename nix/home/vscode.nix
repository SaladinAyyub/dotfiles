{
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.vscode.fhs;
  mutableExtensionsDir = false;
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    danielgavin.ols
    ms-python.python
    charliermarsh.ruff
    enkia.tokyo-night
    esbenp.prettier-vscode
    jnoortheen.nix-ide
  ];
  userSettings = {
    "workbench.startupEditor" = "none";
    "window.titleBarStyle" = "custom";
    "window.commandCenter" = true;
    "workbench.colorTheme" = "Tokyo Night";
    "files.autoSave" = "off";
    "editor.formatOnSave" = true;
    "telemetry.telemetryLevel" = "off";
    "editor.suggest.insertMode" = "replace";
    "editor.minimap.enabled" = false;
    "breadcrumbs.enabled" = false;
    "workbench.activityBar.location" = "hidden";
    "update.showReleaseNotes" = false;
    "zenMode.hideLineNumbers" = false;
    "editor.lineNumbers" = "relative";
    "vim.leader" = "<Space>";
    "vim.hlsearch" = true;
    "editor.fontFamily" = "JetBrains Mono";
    "editor.fontSize" = 16;
    "window.zoomLevel" = 0.5;
    "vim.normalModeKeyBindingsNonRecursive" = [
      {
        "before" = [ "<S-tab>" ];
        "commands" = [ ":bprevious" ];
      } # switch buffers/ tabs
      {
        "before" = [ "tab" ];
        "commands" = [ ":bnext" ];
      }
      {
        "before" = [
          "leader"
          "v"
        ];
        "commands" = [ ":vsplit" ];
      } # split panes
      {
        "before" = [
          "leader"
          "s"
        ];
        "commands" = [ ":split" ];
      }
      {
        "before" = [ "<C-h>" ];
        "commands" = [ "workbench.action.focusLeftGroup" ];
      } # move across panes
      {
        "before" = [ "<C-j>" ];
        "commands" = [ "workbench.action.focusBelowGroup" ];
      }
      {
        "before" = [ "<C-k>" ];
        "commands" = [ "workbench.action.focusAboveGroup" ];
      }
      {
        "before" = [ "<C-l>" ];
        "commands" = [ "workbench.action.focusRightGroup" ];
      }
      {
        "before" = [
          "leader"
          "w"
        ];
        "commands" = [ ":w!" ];
      } # quick commands
      {
        "before" = [
          "leader"
          "q"
        ];
        "commands" = [ ":q!" ];
      }
      {
        "before" = [
          "leader"
          "x"
        ];
        "commands" = [ ":x!" ];
      }
      {
        "before" = [
          "["
          "d"
        ];
        "commands" = [ "editor.action.marker.prev" ];
      } # move across warnings / errors
      {
        "before" = [
          "]"
          "d"
        ];
        "commands" = [ "editor.action.marker.next" ];
      }
      {
        "before" = [
          "leader"
          "c"
          "a"
        ];
        "commands" = [ "editor.action.quickFix" ];
      } # quick actions
      {
        "before" = [
          "leader"
          "f"
        ];
        "commands" = [ "workbench.action.quickOpen" ];
      } # find files
      {
        "before" = [
          "leader"
          "p"
        ];
        "commands" = [ "editor.action.formatDocument" ];
      } # format
      {
        "before" = [
          "g"
          "h"
        ];
        "commands" = [ "editor.action.showDefinitionPreviewHover" ];
      } # preview however definition
    ];

    "vim.visualModeKeyBindings" = [
      {
        "before" = [ "<" ];
        "commands" = [ "editor.action.outdentLines" ];
      } # indent
      {
        "before" = [ ">" ];
        "commands" = [ "editor.action.indentLines" ];
      }
      {
        "before" = [ "J" ];
        "commands" = [ "editor.action.moveLinesDownAction" ];
      } # move complete lines in visual mode
      {
        "before" = [ "K" ];
        "commands" = [ "editor.action.moveLinesUpAction" ];
      }
      {
        "before" = [
          "leader"
          "c"
        ];
        "commands" = [ "editor.action.commentLine" ];
      } # comment line
    ];

    "[jsonc]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[python]" = {
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = {
        "source.fixAll" = "explicit";
        "source.organizeImports" = "explicit";
      };
      "editor.defaultFormatter" = "charliermarsh.ruff";
    };
  };

  keybindings = [
    {
      key = "ctrl+shift+n";
      command = "workbench.action.terminal.focusNext";
      when = "terminalFocus";
    }
    {
      key = "ctrl+shift+b";
      command = "workbench.action.terminal.focusPrevious";
      when = "terminalFocus";
    }
    {
      key = "ctrl+shift+h";
      command = "workbench.action.togglePanel";
    }
    {
      key = "ctrl+shift+a";
      command = "workbench.action.terminal.new";
      when = "terminalFocus";
    }
    {
      key = "ctrl+shift+w";
      command = "workbench.action.terminal.kill";
      when = "terminalFocus";
    }
    {
      command = "workbench.action.toggleSidebarVisibility";
      key = "ctrl+n";
    }
    {
      command = "workbench.files.action.focusFilesExplorer";
      key = "ctrl+n";
      when = "editorTextFocus";
    }
    {
      command = "explorer.newFile";
      key = "a";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      command = "renameFile";
      key = "r";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      command = "explorer.newFolder";
      key = "shif+a";
      when = "explorerViewletFocus";
    }
    {
      command = "workbench.action.newWindow";
      key = "ctrl+shif+n";
      when = "!terminalFocus";
    }
    {
      command = "deleteFile";
      key = "d";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      command = "workbench.action.toggleZenMode";
      key = "ctrl+z";
    }
  ];
}
