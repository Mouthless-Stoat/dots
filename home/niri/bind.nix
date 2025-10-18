action:
with action;
let
  bind = title: action: {
    inherit action;
    hotkey-overlay.title = title;
  };
in
{
  "XF86AudioRaiseVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
  "XF86AudioLowerVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
  "XF86AudioMute".action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  "XF86AudioMicMute".action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

  "XF86MonBrightnessUp".action = spawn "brightnessctl" "--class=backlight" "set" "+10%";
  "XF86MonBrightnessDown".action = spawn "brightnessctl" "--class=backlight" "set" "10%-";

  "Mod+Shift+Slash".action = show-hotkey-overlay;

  "Mod+L" = bind "Focus right" focus-column-or-monitor-right;
  "Mod+H" = bind "Focus right" focus-column-or-monitor-left;
  "Mod+J" = bind "Focus down" focus-window-or-workspace-down;
  "Mod+K" = bind "Focus up" focus-window-or-workspace-up;

  # The movement keybind with shift will move the window and ctrl will do an alternate action

  "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
  "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
  "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
  "Mod+Shift+K".action = move-window-up-or-to-workspace-up;

  "Mod+Ctrl+L".action = focus-monitor-right;
  "Mod+Ctrl+H".action = focus-monitor-left;
  "Mod+Ctrl+Shift+L".action = move-column-to-monitor-right;
  "Mod+Ctrl+Shift+H".action = move-column-to-monitor-left;

  "Mod+Q" = bind "Close window" close-window;
  "Mod+O" = bind "Toggle overview" toggle-overview;
  "Mod+S" = bind "Switch preset" switch-preset-column-width;
  "Mod+F" = bind "Maximize column" maximize-column;
  "Mod+W" = bind "Set width to half" (set-window-width "50%");

  "Mod+Comma" = bind "Consume window" consume-window-into-column;
  "Mod+Period" = bind "Expel window" expel-window-from-column;

  "Mod+T" = bind "Open Terminal" (spawn "kitty");
  "Mod+R" = bind "App Launcher" (spawn-sh "rofi -show drun");

}
