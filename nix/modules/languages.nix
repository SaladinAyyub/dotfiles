{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bun
    cargo-watch
    cargo-cache
    clang
    dioxus-cli
    dotnetCorePackages.dotnet_9.sdk
    fvm
    go
    gnumake
    lua
    zig
    mold
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
