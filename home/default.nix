{
  lib,
  self,
  ...
}: {
  home = {
    username = "tobybridle";
    homeDirectory = "/home/tobybridle";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
