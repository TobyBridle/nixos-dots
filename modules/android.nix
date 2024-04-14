{ pkgs, ... }: {
  virtualisation.waydroid.enable = true;
  programs.adb.enable = true;
  environment.systemPackages = with pkgs; [ gradle zulu ];
}
