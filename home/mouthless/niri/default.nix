{ config, niri, ... }:
{
  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.hide-not-bound = true;
    hotkey-overlay.skip-at-startup = true;

    layout = {
      default-column-width.proportion = 1. / 2.;
      default-column-display = "tabbed";
      empty-workspace-above-first = true;

      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 2. / 3.; }
      ];
      tab-indicator = {
        hide-when-single-tab = true;
        gaps-between-tabs = 16;
      };
      struts = {
        left = 12;
        right = 12;
      };
    };

    binds = import ./bind.nix config.lib.niri.actions;
  };
}
