{config, pkgs, crabby-vim, ...}:

{
  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";

  programs.bash.enable = true;

  home.shellAliases = {
    g = "lazygit";
    gst = "git status";
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
      init.defaultBranch ="main";
    };
  };
  programs.lazygit.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ gcc ];
  };

  home.file."${config.xdg.configHome}/nvim/lua".source = crabby-vim.packages.x86_64-linux.default;
  home.file."${config.xdg.configHome}/nvim/init.lua".source = ./neovim/init.lua;

  home.file."${config.xdg.configHome}/niri/config.kdl".source = ./niri/config.kdl;

  home.stateVersion = "25.05"; # same as the nixos version DO NOT CHANGE
}
