{lib}: let
  #services = {
  #  useMpd = true;
  #};
  #availableColorschemes = {
  #  "oxocarbon" = {
  #    defaultWallpaper = "../../dotfiles/wallpapers/images/oxocarbon-painting.jpg";
  #  };
  #  "catppuccin" = {
  #    defaultWallpaper = "../../dotfiles/wallpapers/images/mocha-painting.jpg";
  #  };
  #};
  colorscheme = ["oxocarbon"];
  extras = [
    "waybar"
    "hyprland"
  ];
in {
  #services = services;
  #availableColorschemes = availableColorschemes;
  colorscheme = colorscheme;
  #extras = extras;
}
