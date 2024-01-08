{
  config,
  pkgs,
  self,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot.loader.grub.device = "nodev";
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nirvana";
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [
    networkmanager
    rocmPackages.clr
  ];
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.clr.icd
      rocm-opencl-runtime
    ];
    driSupport = true;
  };
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.hyprland.enable = true;
  security.tpm2.enable = true;
  hardware.opentabletdriver.enable = true;
  services = {
    fstrim.enable = true;
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
