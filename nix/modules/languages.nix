{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bun
    cargo-watch
    cargo-cache
    clang
    go
    gcc
    gnumake
    lua
    zig
    nodejs
    nil
    nixfmt-rfc-style
    mold
    python3
    rustup
    trunk
    odin
  ];
}
