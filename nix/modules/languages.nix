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
    svelte-language-server
    typescript-language-server
    pyright
    python3
    odin
    ols
    vscode-langservers-extracted
  ];
}
