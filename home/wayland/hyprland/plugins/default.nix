{
  inputs,
  pkgs,
  ...
}: {
  imports = [./pyprland];
  wayland.windowManager.hyprland.plugins = [
    inputs.hyprland-plugins.packages.${pkgs.system}.hyprtrails
  ];
}
