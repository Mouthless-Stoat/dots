action:
with action;
let
  bind = title: action: {
    inherit action;
    hotkey-overlay.title = title;
  };
in
{
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

  "Mod+Q" = bind "Close Window" close-window;
  "Mod+O" = bind "Toggle Overview" toggle-overview;
  "Mod+S" = bind "Switch Preset" switch-preset-column-width;
  "Mod+F" = bind "Maximize Column" maximize-column;

  "Mod+T" = bind "Open Terminal" <| spawn "kitty";
  "Mod+R" = bind "App Launcher" <| spawn-sh "rofi -show drun";

}
