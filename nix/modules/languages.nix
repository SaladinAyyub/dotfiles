{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    gnumake
    zig
    zls
    nodejs
    lua-language-server
    stylua
    taplo
    nil
    nixfmt-rfc-style
    gopls
    delve
    gofumpt
    golines
    goimports-reviser
    nodePackages.prettier
    ruff
    pyright
    odin
    ols
    vscode-langservers-extracted
  ];
}
