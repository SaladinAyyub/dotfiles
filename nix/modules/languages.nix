{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bun
    cargo-watch
    cargo-cache
    clang
    clang-tools
    cmake
    bear
    go
    gcc
    gdb
    gnumake
    lua
    zig
    nodejs
    ninja
    nil
    nixfmt-rfc-style
    mold
    python3
    rustup
    trunk
    odin
  ];
}
