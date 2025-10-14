{
  inputs,
  pkgs,
  config,
  niri,
  ...
}:
{
  imports = [ niri.homeModules.niri ];
  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.hide-not-bound = true;
    hotkey-overlay.skip-at-startup = true;

    layout = {
      default-column-width.proportion = 1. / 2.;
      default-column-display = "tabbed";
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 2. / 3.; }
      ];
    };

    binds = import ./bind.nix config.lib.niri.actions;
  };

  home.packages = with pkgs; [
    kitty
    rofi
    xwayland-satellite
  ];
}
