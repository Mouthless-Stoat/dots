{ config, pkgs, ... }:

{
  imports = [
    ./niri
    ./neovim.nix
    ./git.nix
    ./firefox.nix
    ./shell.nix
  ];

  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.packages = import ./packages.nix pkgs;

  programs.vesktop.enable = true;

  programs.rofi = {
    enable = true;
  };

  home.stateVersion = "25.05"; # same as the nixos version DO NOT CHANGE
}
