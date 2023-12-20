{
  lib,
  pkgs,
  inputs,
  ...
}: let
  ocrScript = let
    inherit (pkgs) grim libnotify slurp tesseract5 wl-clipboard;
    _ = lib.getExe;
  in
    pkgs.writeShellScriptBin "wl-ocr" ''
      ${_ grim} -g "$(${_ slurp})" -t ppm - | ${_ tesseract5} - - | ${wl-clipboard}/bin/wl-copy ${_ libnotify} "$(${wl-clipboard}/bin/wl-paste)"
    '';
in {
  imports = [
    ./hyprland
  ];

  home.packages = with pkgs; [
    grim
    slurp
    ocrScript
    wl-clipboard
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
