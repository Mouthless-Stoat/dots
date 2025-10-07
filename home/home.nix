
{config, pkgs, ...}:

{
  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      st = "status";
    };
    userName = "Mouthless-Stoat";
    userEmail = "nphuyanh@outlook.com";
    extraConfig = {
      init.defaultBranch ="main";
    };
  };

  home.stateVersion = "25.05"; # same as the nixos version DO NOT CHANGE
}
# vim:et:ts=2
