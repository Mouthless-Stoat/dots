{ pkgs, terminal-wakatime, ... }:
{
  home.packages =
    with pkgs;
    [
      fzf
      ripgrep

      fd
      sd
    ]
    ++ [
      terminal-wakatime.packages.x86_64-linux.default
    ];

  programs.bash = {
    enable = true;
    historyControl = [
      "erasedups"
      "ignoreboth"
    ];
    initExtra = "eval \"$(terminal-wakatime init)\"";
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
