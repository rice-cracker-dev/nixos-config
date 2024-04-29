{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprpicker.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    home.packages = with pkgs; [
      # screen capturing
      grim
      slurp
      imagemagick
      swappy

      # clipboard
      wl-clipboard

      # brightness control
      brightnessctl
    ];

    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        # default variables
        "$mainMod" = "SUPER";
        "$terminal" = "${lib.getExe pkgs.foot}";
        "$editor" = "${lib.getExe pkgs.neovim-unwrapped}";
        "$browser" = "${lib.getExe pkgs.foot}";
        "$launcher" = "${lib.getExe pkgs.rofi-wayland} -show drun";
        "$fileManager" = "${lib.getExe pkgs.cinnamon.nemo-with-extensions}";

        exec-once = [
          "hyprpaper"
          "ags"
          "mako"
        ];

        env = [
          # use igpu for hyprland
          # "WLR_DRM_DEVICES,/dev/dri/card1"

          # xdg
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"

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
          # jetbrains fixes

          # vivaldi
          "float, class:^(vivaldi)$, title:^(Vivaldi Settings)$"

          # steam
          "float, class:(steam), title:(Steam)"
          "float, class:(steam), title:(Friends List)"
          "nofocus, class:^(steam)$, title:^()$"
        ];

        monitor = ",preferred,auto,1";

        input = {
          sensitivity = "-0.25";
          accel_profile = "flat";

          # follow_mouse = "2";
        };

        # device = {
        #   "elan1300:00-04f3:3057-touchpad".enabled = "false";
        # };

        general = {
          gaps_in = "4";
          gaps_out = "8";

          border_size = "1";
          # "col.inactive_border" = "0x40${base05}";
          # "col.active_border" = "0xff${base0E}";

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

        device = {
          name = "elan1300:00-04f3:3057-touchpad";
          enabled = false;
        };

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

          # screenshotting
          ", print, exec, grim - | wl-copy"
          "CTRL, print, exec, grim -g \"$(slurp)\" - | wl-copy"
          "ALT, print, exec, grim -g \"$(slurp)\" - | swappy -f -"

          # colorpicker
          "$mainMod SHIFT, c, exec, hyprpicker -a"

          # obs studio pass
          "$mainMod, F10, pass, ^(com\.obsproject\.Studio)$"
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
  };
}
