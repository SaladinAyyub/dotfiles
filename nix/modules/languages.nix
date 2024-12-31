{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    go
    rustup
    gnumake
    zig
    zls
    nodejs
    lua-language-server
    stylua
    nil
    gopls
    delve
    gofumpt
    golines
    goimports-reviser
    nodePackages.prettier
    ruff
  ];
}