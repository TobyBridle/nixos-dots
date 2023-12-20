{
  name ? "DP-1",
  res ? "1920x1080",
  refresh ? "60",
  pos ? "0x0",
  scale ? "1",
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "monitor" = "${name},${res}@${refresh},${pos},${scale}";
  };
}
