{
  pkgs,
  config,
  niri,
  ...
}:
{
  home.packages = with pkgs; [
    kitty # terminal
    rofi # app launcher
    brightnessctl # for brightness control of laptop
    wl-clipboard # clipboard manager
    libsecret # for password and secreting
    cage # for maximizing app
    gamescope # gaming
    xwayland-satellite # support for x app on wayland
  ];

  # services.mako.enable = true;

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

      tab-indicator = {
        hide-when-single-tab = true;
        gaps-between-tabs = 16;
      };

      focus-ring = {
        active.color = "#41a7fc";
      };

      struts = {
        left = 16;
        right = 16;
      };
    };

    binds = import ./bind.nix config.lib.niri.actions;
  };
}
