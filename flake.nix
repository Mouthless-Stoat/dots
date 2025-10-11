{
  description = "Flakes to manage NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crabby-vim.url = "github:Mouthless-Stoat/CrabbyVim";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      crabby-vim,
        niri,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
          niri.nixosModules.niri
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ niri.overlays.niri ];
              programs.niri.enable = true;
              environment.variables.NIXOS_OZONE_WL = "1";
              environment.systemPackages = with pkgs; [
                wl-clipboard
                wayland-utils
                libsecret
                cage
              ];
            }
          )
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
