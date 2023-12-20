{
  self,
  inputs,
  ...
}: let
  module_args._module.args = {
    inherit self inputs;
  };
in {
  imports = [
    {
      _module.args = {
        inherit module_args;

        sharedModules = [
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }

          inputs.home-manager.nixosModule
          inputs.nh.nixosModules.default
          inputs.hyprland.nixosModules.default
          module_args
          self.nixosModules.core
          self.nixosModules.nix
        ];
      };
    }
  ];

  flake.nixosModules = {
    core = import ./core.nix;
    nix = import ./nix.nix;
  };
}
