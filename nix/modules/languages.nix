{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bun
    cargo-watch
    cargo-cache
    cmake
    bear
    dotnetCorePackages.dotnet_9.sdk
    fvm
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
    pocketbase
    rustup
    trunk
    odin
  ];
}
