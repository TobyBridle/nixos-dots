{pkgs, ...}: {
  imports = [
    ../../wayland
    (import ../../git {
      inherit pkgs;
      userName = "Toby Bridle";
      userEmail = "foreignspaghettibolognese@gmail.com";
    })
    ../../browsers/librewolf
  ];
}
