{ config
, pkgs
, self
, inputs
, ...
}: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub.device = "nodev";
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  # boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nirvana";
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [
    networkmanager
    rocmPackages.clr
  ];
  programs.nix-ld.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
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

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  services.postgresql = {
    enable = true;
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
}
