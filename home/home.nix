{
  config,
  pkgs,
  crabby-vim,
  ...
}:

{
  imports = [ ./niri ];

  home.username = "mouthless";
  home.homeDirectory = "/home/mouthless";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.packages = with pkgs; [
    fzf
    ripgrep
    git-credential-manager
    pass
    gnupg
    steam-tui
    steamcmd
  ];

  programs.bash.enable = true;

  home.shellAliases = {
    g = "lazygit";
    gst = "git status";
    rebuild = "cd ~/dots && sudo nix fmt && sudo nixos-rebuild";
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

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ typst ];
  };

  home.file."${config.xdg.configHome}/nvim/lua".source = crabby-vim.packages.x86_64-linux.default;
  home.file."${config.xdg.configHome}/nvim/init.lua".source = ./neovim/init.lua;

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
