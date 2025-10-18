{ config, pkgs, ... }:

{
  imports = [
    ./niri
    ./neovim
  ];

  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.packages = import ./packages.nix pkgs;

  programs.bash.enable = true;

  home.shellAliases = {
    g = "lazygit";
    gst = "git status";
    rebuild = "cd ~/dots && sudo nix fmt && sudo nixos-rebuild";
  };
  programs.zoxide.enable = true;

  programs.eza = {
    enable = true;
    icons = "always";
    extraOptions = [ "-a" ];
  };

  # git config
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      st = "status";
    };
    userName = "Mouthless-Stoat";
    userEmail = "nphuyanh@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "manager";
      credential.credentialStore = "plaintext";
    };
  };
  programs.lazygit.enable = true;

  programs.firefox = {
    enable = true;
    profiles.personal = {
      isDefault = true;
      extensions.force = true;
    };
  };
  programs.vesktop.enable = true;

  programs.rofi = {
    enable = true;
  };

  home.stateVersion = "25.05"; # same as the nixos version DO NOT CHANGE
}
