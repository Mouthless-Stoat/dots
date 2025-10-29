{ config, pkgs, ... }:

{
  imports = [
    ./niri # scrolling window manager
    ./neovim.nix # code editor, the code doesn;t actually live here but instead the CrabbyVim flake
    ./git.nix # git config and stuff
    ./firefox.nix # firefox
    ./bash.nix # shell command and stuff
  ];

  # Basic feature
  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";

  # import in the package
  home.packages = import ./packages.nix pkgs;

  dconf.settings = {
    # enable dark mode
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # discord alternative
  programs.vesktop = {
    enable = true;
    settings = {
      autoUpdate = false;
      disableMinSize = true;
      vencord = {
        VolumeBooster.enable = true;
        FakeNitro.enable = true;
        WhoReacted.enable = true;
      };
    };
  };
  programs.rofi.enable = true; # app launcher

  home.stateVersion = "25.05"; # same as the nixos version DO NOT CHANGE
}
