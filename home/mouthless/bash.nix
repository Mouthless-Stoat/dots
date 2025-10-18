{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
    ripgrep
    fd
  ];
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
}
