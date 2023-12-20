{
  pkgs,
  lib,
  systemName ? "nirvana",
  ...
}: let
  config = import ../../${systemName}/settings.nix;
in {
  home.packages = with pkgs; [
    kitty
  ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
     bind = [
	"$mod, RETURN, exec, ${pkgs.wezterm}/bin/wezterm"
     ];
  };
  #  wayland.windowManager.hyprland.extraConfig = ''
  #       source ~/.config/hypr/themes/catppuccin.conf
  #    	exec-once = ${pkgs.swww}/bin/swww init
  #    	exec-once = ${pkgs.mako}/bin/mako
  #
  #    	exec-once = sh ~/.config/scripts/startup_script.sh
  #    		exec-once = ${pkgs.copyq}/bin/copyq
  #    		exec-once = ${pkgs.imwheel}/bin/imwheel
  #    		exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
  #
  #    #
  #    # Please note not all available settings / options are set here.
  #    # For a full list, see the wiki
  #    #
  #
  #    # See https://wiki.hyprland.org/Configuring/Monitors/
  #    		monitor=,2560x1440@165,auto,auto
  #
  #    # Some default env vars.
  #    		env = XCURSOR_SIZE,24
  #
  #    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
  #    		input {
  #    			kb_layout = us
  #    				kb_rules =
  #    				repeat_delay = 300
  #    				repeat_rate = 50
  #    				follow_mouse = 1
  #
  #    				touchpad {
  #    					natural_scroll = no
  #    				}
  #
  #    			sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
  #    		}
  #
  #    	general {
  #    # See https://wiki.hyprland.org/Configuring/Variables/ for more
  #
  #    		gaps_in = 10
  #    			gaps_out = {{gaps-out}}
  #    		border_size = 2
  #    	}
  #
  #    	decoration {
  #    # See https://wiki.hyprland.org/Configuring/Variables/ for more
  #
  #    		blur {
  #    			enabled = yes
  #    				size = 12
  #    				xray = true
  #    				passes = 8
  #    				new_optimizations = true
  #    		}
  #
  #    		rounding = 15
  #    			drop_shadow = yes
  #    			shadow_range = 4
  #    			shadow_render_power = 3
  #    			col.shadow = rgba(1a1a1aee)
  #
  #    			inactive_opacity = 0.85
  #    			active_opacity = 0.75
  #
  #    			dim_inactive = true
  #    			dim_strength = 0.2
  #    	}
  #
  #    	animations {
  #    		enabled = yes
  #
  #    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
  #
  #    			bezier = myBezier, 0.1, 0.9, 0.1, 1.05
  #
  #    			animation = windows, 1, 3, myBezier
  #    			animation = windowsOut, 1, 7, default, popin 80%
  #    			animation = border, 1, 10, default
  #    			animation = borderangle, 1, 8, default
  #    			animation = fade, 1, 8, default
  #    			animation = workspaces, 1, 6, default
  #    	}
  #
  #    	dwindle {
  #    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
  #    		pseudotile = yes # master switch for pseudotiling. Enabling is bound to mod + P in the keybinds section below
  #    			preserve_split = yes # you probably want this
  #    	}
  #
  #    	master {
  #    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
  #    		new_is_master = false
  #    	}
  #
  #    	gestures {
  #    # See https://wiki.hyprland.org/Configuring/Variables/ for more
  #    		workspace_swipe = off
  #    	}
  #
  #    # Example per-device config
  #    # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
  #    device:epic mouse V1 {
  #    				 sensitivity = -0.5
  #    			 }
  #
  #    # Example windowrule v1
  #    # windowrule = float, ^(kitty)$
  #    # Example windowrule v2
  #    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
  #    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  #
  #    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
  #    			 $mod = SUPER
  #
  #    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more bind = $mod, Q, exec, kitty bind = $mod, C, killactive, bind = $mod, M, exit, bind = $mod, E, exec, dolphin
  #    				 bind = $mod, V, togglefloating,
  #    							bind = $mod, F, fullscreen, 1
  #    								bind = $mod, C, killactive
  #
  #    # Move focus with mod + hjkl keys
  #    								bind = $mod, h, movefocus, l
  #    								bind = $mod, l, movefocus, r
  #    								bind = $mod, k, movefocus, u
  #    								bind = $mod, j, movefocus, d
  #
  #    # Switch workspaces with mod + [0-9]
  #    								bind = $mod, 1, workspace, 1
  #    								bind = $mod, 2, workspace, 2
  #    								bind = $mod, 3, workspace, 3
  #    								bind = $mod, 4, workspace, 4
  #    								bind = $mod, 5, workspace, 5
  #    								bind = $mod, 6, workspace, 6
  #    								bind = $mod, 7, workspace, 7
  #    								bind = $mod, 8, workspace, 8
  #    								bind = $mod, 9, workspace, 9
  #    								bind = $mod, 0, workspace, 10
  #
  #    # Move active window to a workspace with mod + SHIFT + [0-9]
  #    								bind = $mod SHIFT, 1, movetoworkspace, 1
  #    								bind = $mod SHIFT, 2, movetoworkspace, 2
  #    								bind = $mod SHIFT, 3, movetoworkspace, 3
  #    								bind = $mod SHIFT, 4, movetoworkspace, 4
  #    								bind = $mod SHIFT, 5, movetoworkspace, 5
  #    								bind = $mod SHIFT, 6, movetoworkspace, 6
  #    								bind = $mod SHIFT, 7, movetoworkspace, 7
  #    								bind = $mod SHIFT, 8, movetoworkspace, 8
  #    								bind = $mod SHIFT, 9, movetoworkspace, 9
  #    								bind = $mod SHIFT, 0, movetoworkspace, 10
  #
  #    # Scroll through existing workspaces with mod + scroll
  #    								bind = $mod, mouse_down, workspace, e+1
  #    								bind = $mod, mouse_up, workspace, e-1
  #
  #    								bind = $mod, return, exec, ${pkgs.wezterm}/bin/wezterm
  #    								bind = $mod, p, pin
  #    								bind = $mod, o, toggleopaque
  #
  #    # Move/resize windows with mod + LMB/RMB and dragging
  #    								bindm = $mod, mouse:272, movewindow
  #    								bindm = $mod, mouse:273, resizewindow
  #
  #    								bind = CTRL SHIFT, 3, exec, ~/.config/scripts/screenshot.sh fullscreen
  #    								bind = CTRL SHIFT, 4, exec, ~/.config/scripts/screenshot.sh select-area
  #    								bind= CTRL SHIFT, 5,exec,~/.config/scripts/screenrecord.sh start
  #    								bind= CTRL SHIFT, 9, exec,~/.config/scripts/screenrecord.sh stop
  #    								bind = CTRL SHIFT, 6, exec, hyprpicker | ${pkgs.wl-clipboard}/bin/wl-copy
  #
  #    			 bind=$mod,a,exec,~/.config/scripts/set_swww_wallpaper.sh
  #    				 bind=$mod,b,exec,~/.config/scripts/set_swww_wallpaper.sh
  #
  #    			 bind=$mod SHIFT, b, exec, copyq toggle
  #
  #    				 bind=$mod,g,submap,groups
  #    				 submap = groups
  #    				 bind= ,m, togglegroup
  #    				 bind= ,f, changegroupactive, f
  #    				 bind= ,b, changegroupactive, b
  #    				 bind=$mod, h, moveintogroup, l
  #    				 bind=$mod, j, moveintogroup, d
  #    				 bind=$mod, k, moveintogroup, u
  #    				 bind=$mod, l, moveintogroup, r
  #    				 bind=$mod, g, submap, reset
  #    				 bind=,r,moveoutofgroup,
  #    				 bind=,escape,submap,reset
  #    					 submap = reset
  #    					 bind=$mod, tab, changegroupactive, f
  #    					 bind=$mod SHIFT, tab, changegroupactive, b
  #
  #    					 bind=$mod,r,submap,rofi
  #    					 submap = rofi
  #    					 bind = ,j, exec, TERM=xterm-256color jerry --rofi -i -d
  #    					 bind = ,j, submap, reset
  #    					 bind = ,r, exec, rofi -show drun
  #    					 bind = ,r, submap, reset
  #    					 bind = ,t, exec, ~/.config/scripts/colorscheme_switcher.sh
  #    					 bind = ,t, submap, reset
  #    					 bind = ,g, exec, ~/.config/scripts/gpt-script
  #    					 bind = ,g, submap, reset
  #    					 bind=$mod,r,submap,reset
  #    					 bind=,escape,submap,reset
  #    					 submap = reset
  #
  #    					 windowrule=opacity 0.9 override,Rofi
  #    					 windowrule = workspace 1 silent,title:.*cord.*$
  #  '';
}
#

