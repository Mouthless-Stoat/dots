{
  description = "Flakes to manage NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crabby-vim = {
      url = "github:Mouthless-Stoat/CrabbyVim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    terminal-wakatime = {
      url = "github:hackclub/terminal-wakatime";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      crabby-vim,
      niri,
      terminal-wakatime,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
          niri.nixosModules.niri
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mouthless = ./home/mouthless;
            home-manager.extraSpecialArgs = { inherit crabby-vim niri terminal-wakatime; };
          }
          (
            { pkgs, ... }:
            {
              programs.niri = {
                enable = true;
                package = pkgs.niri; # Use the package that come with the nixpkgs
              };
              # for electron and chromium support.
              environment.variables.NIXOS_OZONE_WL = "1";
            }
          )
        ];
      };
    };
}
