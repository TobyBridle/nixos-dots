{ ... }: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      config.enable_wayland = true;
    '';
  };
}
