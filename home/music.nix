{ pkgs, ... }: {
  xdg.userDirs.enable = true;
  services.mpd = {
    enable = true;
  };
  services.mpd-discord-rpc.enable = true;
  services.mpdris2.enable = true;
  programs.ncmpcpp = {
    enable = true;
  };
  home.packages = with pkgs; [ mpc-cli ];
}
