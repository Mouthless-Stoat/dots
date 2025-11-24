{
  pkgs,
  config,
  terminal-wakatime,
  ...
}:
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
    h = "source <(history | sd \"^\\s*\\d+\\s*\" \"\" | sort | uniq | fzf)";
  };

  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.eza = {
    enable = true;
    icons = "always";
  };

  home.file."${config.xdg.configHome}/omp/theme.toml".source = ./omp/theme.toml;
  programs.oh-my-posh = {
    enable = true;
    configFile = "${config.xdg.configHome}/omp/theme.toml";
  };
}
