{
  description = "Flakes to manage NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crabby-vim.url = "github:Mouthless-Stoat/CrabbyVim";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      crabby-vim,
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
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mouthless = ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit crabby-vim; };
          }
        ];
      };
    };
}
# vim:et:ts=2
