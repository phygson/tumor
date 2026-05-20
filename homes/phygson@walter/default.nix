{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "phygson";
  home.homeDirectory = "/home/phygson";
  home.packages = with pkgs; [protonup-qt rose-pine-hyprcursor];

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
  programs.wofi.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      font_size = 12.0;
      shell = "fish -i";
    };
  };

  programs.mpv.enable = true;

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "pure-fish";
        src = pkgs.fishPlugins.pure;
      }
    ];
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      #exec-once = [ "systemctl --user start hyprpaper" ];
      monitor = "DP-2, 1920x1080@60, 0x0, 1";
      "$mod" = "SUPER";
      bind = [
        "$mod, L, exec, hyprlock"
        "$mod, D, exec, wofi --show drun"
        "$mod, B, exec, firefox"
	"$mod, F, exec, kitty fish -i -c y"
        "$mod, RETURN, exec, kitty"
        "$mod, W, killactive"
	"$mod, V, togglefloating"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
	"$mod, mouse_down, workspace, e+1"
	"$mod, mouse_up, workspace, e-1"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
      };
      windowrule = [ 
        {
	  name = "ff-fullscreen";
	  "match:class" = "firefox";
	  fullscreen = "on";
        }
	{
	  name = "steam-fullscreen";
	  "match:class" = "steam";
	  fullscreen = "on";
	}
      ];
    };
  };
  programs.hyprlock = {
    enable = true;
    extraConfig = ''      # sample hyprlock.conf
      # for more configuration options, refer https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock
      #
      # rendered text in all widgets supports pango markup (e.g. <b> or <i> tags)
      # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#general-remarks
      #
      # shortcuts to clear password buffer: ESC, Ctrl+U, Ctrl+Backspace
      #
      # you can get started by copying this config to ~/.config/hypr/hyprlock.conf
      #

      $font = Monospace

      general {
          hide_cursor = false
      }

      # uncomment to enable fingerprint authentication
      # auth {
      #     fingerprint {
      #         enabled = true
      #         ready_message = Scan fingerprint to unlock
      #         present_message = Scanning...
      #         retry_delay = 250 # in milliseconds
      #     }
      # }

      animations {
          enabled = true
          bezier = linear, 1, 1, 0, 0
          animation = fadeIn, 1, 5, linear
          animation = fadeOut, 1, 5, linear
          animation = inputFieldDots, 1, 2, linear
      }

      background {
          monitor =
          path = screenshot
          blur_passes = 3
      }

      input-field {
          monitor =
          size = 20%, 5%
          outline_thickness = 3
          inner_color = rgba(0, 0, 0, 0.0) # no fill

          outer_color = rgba(33ccffee) rgba(00ff99ee) 45deg
          check_color = rgba(00ff99ee) rgba(ff6633ee) 120deg
          fail_color = rgba(ff6633ee) rgba(ff0066ee) 40deg

          font_color = rgb(143, 143, 143)
          fade_on_empty = false
          rounding = 15

          font_family = $font
          placeholder_text = Input password...
          fail_text = $PAMFAIL

          # uncomment to use a letter instead of a dot to indicate the typed password
          # dots_text_format = *
          # dots_size = 0.4
          dots_spacing = 0.3

          # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
          # hide_input = true

          position = 0, -20
          halign = center
          valign = center
      }

      # TIME
      label {
          monitor =
          text = $TIME # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution
          font_size = 90
          font_family = $font

          position = -30, 0
          halign = right
          valign = top
      }

      # DATE
      label {
          monitor =
          text = cmd[update:60000] date +"%A, %d %B %Y" # update every 60 seconds
          font_size = 25
          font_family = $font

          position = -30, -150
          halign = right
          valign = top
      }

      label {
          monitor =
          text = $LAYOUT[en,ru]
          font_size = 24
          onclick = hyprctl switchxkblayout all next

          position = 250, -20
          halign = center
          valign = center
      }'';
  };
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      wallpaper = [
        {
          monitor = "HDMI-A-1";
          path = "~/Pictures/wallpaper.png";
          fit_mode = "cover";
        }
      ];
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
