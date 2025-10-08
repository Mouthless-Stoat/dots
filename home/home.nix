
{config, pkgs, ...}:

{
  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";


  programs.bash.enable = true;
  home.shellAliases = {
    g = "lazygit";
    gst = "git status";
  };

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

  programs.lazygit.enable = true;

  home.stateVersion = "25.05"; # same as the nixos version DO NOT CHANGE
}
# vim:et:ts=2
