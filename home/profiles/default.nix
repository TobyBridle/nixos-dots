{
  self,
  inputs,
  withSystem,
  module_args,
  ...
}: let
  sharedModules = [
    ../.
    module_args
    inputs.hyprland.homeManagerModules.default
  ];

  homeImports = {
    "tobybridle@nirvana" = [./nirvana] ++ sharedModules;
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  imports = [
    {_module.args = {inherit homeImports;};}
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
      "tobybridle@nirvana" = homeManagerConfiguration {
        modules = homeImports."tobybridle@nirvana";
        inherit pkgs;
      };
    });
  };
}
