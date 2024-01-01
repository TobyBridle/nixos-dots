{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    pyprland
  ];

  home.file = {
    pyprland-config = {
      target = ".config/hypr/pyprland.toml";
      text = builtins.readFile ./pyprland-config.toml;
    };
  };

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = pypr
    bind = $mainMod, m, exec, pypr toggle "music"
    windowrulev2 = float,class:^(pyprland-scratchpad)
    windowrulev2 = center,class:^(pyprland-scratchpad)
    windowrulev2 = workspace special silent,class:^(pyprland-scratchpad)
  '';
}
