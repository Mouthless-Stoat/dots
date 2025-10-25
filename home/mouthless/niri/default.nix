{ config, niri, ... }:
{
  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.hide-not-bound = true;
    hotkey-overlay.skip-at-startup = true;

    window-rules = [
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        default-column-width.proportion = 1. / 4.;
        default-window-height.proportion = 1. / 4.;
        open-floating = true;
      }
    ];

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
        left = 32;
        right = 32;
      };
    };

    binds = import ./bind.nix config.lib.niri.actions;
  };
}
