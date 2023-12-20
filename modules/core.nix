{
  pkgs,
  lib,
  ...
}: {
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };
  hardware.opengl.enable = true;
  zramSwap.enable = true;

  users.users.tobybridle = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["adbusers" "input" "networkmanager" "wheel"];
    hashedPassword = "$6$rounds=200000$VpT7JVZd1qKfeVx0$drRUy6f15GLFIWVUTpbp6z74bvckNb4AqfQ27JkAxDzAlcGxcwDv5IWmsfu05n8xoC.Tud03nXNKGKpl9rNnr1";
  };

  system.stateVersion = "23.05";
}
