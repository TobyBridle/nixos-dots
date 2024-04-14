{ pkgs
, inputs
, lib
, systemName ? "nirvana"
, ...
}:
let
  config = import ../../${systemName}/settings.nix;

  monitorConfig =
    import ./monitors.nix
      {
        res = "2560x1440";
        refresh = "165";
      };
  pluginConfig = import ./plugins { inherit inputs pkgs; };
in
{
  imports = [ monitorConfig pluginConfig ];
  home.packages = with pkgs; [
    # Hyprland likes kitty
    kitty

    wezterm
    rofi-wayland
    swww
    mako
    imwheel
    copyq
  ];

  wayland.windowManager.hyprland.settings."$mainMod" = "SUPER";
  wayland.windowManager.hyprland.extraConfig = ''

    exec-once = swww init
    exec-once = mako

    exec-once = sh ~/.config/scripts/startup_script.sh
    exec-once = copyq
    exec-once = imwheel
    exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

    #
    # Please note not all available settings / options are set here.
    # For a full list, see the wiki
    #

    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor=,2560x1440@165,auto,auto

    # Some default env vars.
    env = XCURSOR_SIZE,24

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input {
        kb_layout = us
        kb_rules =
        repeat_delay = 300
        repeat_rate = 50
        follow_mouse = 1

        touchpad {
            natural_scroll = no
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 10
        gaps_out = 10
        border_size = 2

    }

    decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

    		blur {
    			enabled = yes
    			size = 12
    			xray = true
    			passes = 8
    			new_optimizations = true
    		}

        rounding = 15
        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)

        inactive_opacity = 0.85
        active_opacity = 0.75

        dim_inactive = true
        dim_strength = 0.2
    }

    animations {
        enabled = yes

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.1, 0.9, 0.1, 1.05

        animation = windows, 1, 3, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 8, default
        animation = workspaces, 1, 6, default
    }

    dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }

    master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = false
    }

    gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = off
    }

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    $mainMod = SUPER

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more bind = $mainMod, Q, exec, kitty bind = $mainMod, C, killactive, bind = $mainMod, M, exit, bind = $mainMod, E, exec, dolphin
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, F, fullscreen, 1
    bind = $mainMod, C, killactive

    # Move focus with mainMod + hjkl keys
    bind = $mainMod, h, movefocus, l
    bind = $mainMod, l, movefocus, r
    bind = $mainMod, k, movefocus, u
    bind = $mainMod, j, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bind = $mainMod, return, exec, kitty
    bind = $mainMod, p, pin
    bind = $mainMod, o, toggleopaque

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    bind = CTRL SHIFT, 3, exec, ~/.config/scripts/screenshot.sh fullscreen
    bind = CTRL SHIFT, 4, exec, ~/.config/scripts/screenshot.sh select-area
    bind= CTRL SHIFT, 5,exec,~/.config/scripts/screenrecord.sh start
    bind= CTRL SHIFT, 9, exec,~/.config/scripts/screenrecord.sh stop
    bind = CTRL SHIFT, 6, exec, hyprpicker | wl-copy

    bind=$mainMod,a,exec,~/.config/scripts/set_swww_wallpaper.sh
    bind=$mainMod,b,exec,~/.config/scripts/set_swww_wallpaper.sh

    bind=$mainMod SHIFT, b, exec, copyq toggle

    bind=$mainMod,g,submap,groups
    submap = groups
    bind= ,m, togglegroup
    bind= ,f, changegroupactive, f
    bind= ,b, changegroupactive, b
    bind=$mainMod, h, moveintogroup, l
    bind=$mainMod, j, moveintogroup, d
    bind=$mainMod, k, moveintogroup, u
    bind=$mainMod, l, moveintogroup, r
    bind=$mainMod, g, submap, reset
    bind=,r,moveoutofgroup,
    bind=,escape,submap,reset
    submap = reset
    bind=$mainMod, tab, changegroupactive, f
    bind=$mainMod SHIFT, tab, changegroupactive, b

    bind=$mainMod,r,submap,rofi
    submap = rofi
    bind = ,j, exec, TERM=xterm-256color jerry --rofi -i -d
    bind = ,j, submap, reset
    bind = ,r, exec, rofi -show drun
    bind = ,r, submap, reset
    bind = ,t, exec, ~/.config/scripts/colorscheme_switcher.sh
    bind = ,t, submap, reset
    bind = ,g, exec, ~/.config/scripts/gpt-script
    bind = ,g, submap, reset
    bind=$mainMod,r,submap,reset
    bind=,escape,submap,reset
    submap = reset

    windowrule=opacity 0.9 override,Rofi
    windowrule = workspace 1 silent,title:.*cord.*$
  '';
}
