{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
    ripgrep

    fd
    sd
  ];

  programs.bash = {
    enable = true;
    historyControl = [
      "erasedups"
      "ignoreboth"
    ];
  };

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
