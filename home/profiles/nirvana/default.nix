{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../wayland
    (import ../../git {
      inherit pkgs;
      userName = "Toby Bridle";
      userEmail = "foreignspaghettibolognese@gmail.com";
    })
    ../../browsers/librewolf
    ../../editors/nvim
    ../../music.nix
  ];

  home.packages = with pkgs; [
    vesktop
    blender-hip
    xdg-utils
    androidStudioPackages.canary
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    opentabletdriver
    vscode
    discord-screenaudio
  ];
}
