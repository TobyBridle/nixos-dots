{ inputs
, sharedModules
, homeImports
, ...
}: {
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
    in
    {
      nirvana = nixosSystem {
        modules =
          [
            ./nirvana
            ../modules/zsh.nix
            ../modules/android.nix
            { home-manager.users.tobybridle.imports = homeImports."tobybridle@nirvana"; }
          ]
          ++ sharedModules;
      };
    };
}
