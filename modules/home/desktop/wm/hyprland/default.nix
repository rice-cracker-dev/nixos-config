{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # default variables
      "$mainMod" = "SUPER";
      "$terminal" = "${lib.getExe config.programs.kitty.package}";
      "$editor" = "${lib.getExe pkgs.neovim-unwrapped}";
      "$browser" = "${lib.getExe pkgs.floorp}";
      "$launcher" = "ags -r 'toggleStartMenu()'";
      "$fileManager" = "${lib.getExe pkgs.cinnamon.nemo-with-extensions}";

      env = [
        # use igpu for hyprland
        # "WLR_DRM_DEVICES,/dev/dri/card1"

        # xdg
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SCREENSHOTS_DIR,${config.screenshotsDir}"

        # qt
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

        # utilities
        "TERMINAL,$terminal"
        "EDITOR,$editor"
        "BROWSER,$browser"
      ];

      windowrulev2 = [
        # steam
        "float, class:(steam), title:(Steam)"
        "float, class:(steam), title:(Friends List)"
        "nofocus, class:^(steam)$, title:^()$"

        # flameshot
        "float, title:^(flameshot)"
        "move 0 0, title:^(flameshot)"
        "suppressevent fullscreen, title:^(flameshot)"

        # satty
        "noanim, class:(com.gabm.satty)"
        "float, class:(com.gabm.satty)"
      ];

      layerrule = [
        "blur, rofi"
        "ignorezero, rofi"

        # ags
        "blur, ags-*"
        "ignorezero, ags-*"

        # sexshell
        "blur, quickshell"
        "ignorezero, quickshell"
      ];

      monitor = ",preferred,auto,1";

      input = {
        sensitivity = "-0.25";
        accel_profile = "flat";

        follow_mouse = "0";
      };

      general = {
        gaps_in = "4";
        gaps_out = "8";

        no_cursor_warps = "true";

        layout = "dwindle";
      };

      decoration = {
        rounding = "8";

        drop_shadow = "false";
        # shadow_range = "4";
        # shadow_render_power = "3";
        # "col.shadow" = "rgba(1a1a1aee)";

        # dim_inactive = "true";

        blur = {
          enabled = "true";
          size = "8";
          passes = "4";
          popups = "true";
        };
      };

      #device = {
      #  name = "elan1300:00-04f3:3057-touchpad";
      #  enabled = false;
      #};

      bind = [
        # apps
        "$mainMod, return, exec, $terminal"
        "$mainMod, q, exec, $browser"
        "$mainMod, d, exec, $launcher"
        "$mainMod, e, exec, $fileManager"

        # toggle floating window
        "$mainMod, v, togglefloating"

        # close active window
        "alt, f4, killactive"

        # close hyprland session
        "$mainMod, m, exit"

        # move focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"

        # move active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"

        # scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # obs studio pass
        # "$mainMod, F10, pass, ^(com\.obsproject\.Studio)$"

        # screenshotting
        ", PRINT, exec, grimblast copysave screen"
        "CTRL, PRINT, exec, grimblast copysave area"
        "ALT, PRINT, exec, grimblast save area - | satty -f -"
        "SHIFT, PRINT, exec, grimblast copysave active"
      ];

      bindm = [
        # move & resize windows
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        # pipewire volume control
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ];
    };
  };
}
