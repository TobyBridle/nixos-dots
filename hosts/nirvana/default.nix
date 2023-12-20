{
  config,
  pkgs,
  self,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot.loader.grub.device = "nodev";

  networking.hostName = "nirvana";
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [
    networkmanager
  ];
  programs.hyprland.enable = true;
  security.tpm2.enable = true;
  services = {
    fstrim.enable = true;
  };
}
