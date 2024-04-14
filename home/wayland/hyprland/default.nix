{
  inputs,
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  wayland.windowManager.hyprland.enable = true;
  imports = [./config.nix];
}
