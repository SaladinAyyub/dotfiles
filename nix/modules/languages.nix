{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
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
  ];
}
