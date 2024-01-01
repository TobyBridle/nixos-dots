{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [./config.nix plugins ];
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  wayland.windowManager.hyprland.enable = true;
}
