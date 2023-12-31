{
  config,
  pkgs,
  self,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
  ];

  nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };

  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];

    trusted-users = ["root" "@wheel"];
  };

  nixpkgs.config.allowUnfree = true;
}
