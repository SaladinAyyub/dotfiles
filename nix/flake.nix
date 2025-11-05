{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    alacritty-theme.inputs.nixpkgs.follows = "nixpkgs";

    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      alacritty-theme,
      zen-browser,
      nur,
      ...
    }@inputs:
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; zen-browser = inputs.zen-browser; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          (
            { config, pkgs, ... }:
            {
              # install the overlay
              nixpkgs.overlays = [ alacritty-theme.overlays.default inputs.nur.overlays.default ];
            }
          )
          (
            { config, pkgs, ... }:
            {
              home-manager.users.saladin = hm: {
                programs.alacritty = {
                  enable = true;
                  settings.general.import = [ pkgs.alacritty-theme.tokyo_night ];
                };
              };
            }
          )
        ];
      };
    };
}
