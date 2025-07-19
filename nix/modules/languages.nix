{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bun
    cargo-watch
    cargo-cache
    go
    gcc
    gnumake
    lua
    zig
    nodejs
    nil
    mold
    python3
    rustup
    trunk
    odin
  ];
}
