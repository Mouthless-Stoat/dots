{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    quickshell
  ];
  # home.file."${config.xdg.configHome}/quickshell/shell.qml".source = ./shell.qml;
}
