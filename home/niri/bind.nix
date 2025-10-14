action: with action; {
  "Mod+Shift+Slash".action = show-hotkey-overlay;

  "Mod+L".action = focus-column-or-monitor-right;
  "Mod+L".hotkey-overlay.title = "󰜴 Focus right";
  "Mod+H".action = focus-column-or-monitor-left;
  "Mod+H".hotkey-overlay.title = "󰜱 Focus right";

  "Mod+J".action = focus-window-or-workspace-down;
  "Mod+J".hotkey-overlay.title = "󰜮 Focus down";
  "Mod+K".action = focus-window-or-workspace-up;
  "Mod+K".hotkey-overlay.title = "󰜷 Focus up";

  "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
  "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
  "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
  "Mod+Shift+K".action = move-window-up-or-to-workspace-up;

  "Mod+Ctrl+L".action = focus-monitor-right;
  "Mod+Ctrl+H".action = focus-monitor-left;
  "Mod+Ctrl+Shift+L".action = move-column-to-monitor-right;
  "Mod+Ctrl+Shift+H".action = move-column-to-monitor-left;

  "Mod+Q".action = close-window;
  "Mod+O".action = toggle-overview;

  "Mod+T".action = spawn "kitty";
  "Mod+T".hotkey-overlay.title = "  Open Terminal";
  "Mod+R" = {
    action = spawn-sh "rofi -show drun";
    hotkey-overlay.title = "  App Launcher";
  };

  "Mod+S".action = switch-preset-column-width;
}
