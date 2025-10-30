{
  pkgs,
  config,
  crabby-vim,
  ...
}:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      gcc
      python315
      nodejs_22
      typstyle
      prettier
      unzip
      rustfmt
    ];
  };

  home.file."${config.xdg.configHome}/nvim/lua".source = crabby-vim.packages.x86_64-linux.default;
  home.file."${config.xdg.configHome}/nvim/init.lua".text = "require(\"config\")";
}
