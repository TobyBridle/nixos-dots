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
  ];

  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    opentabletdriver
  ];
}
