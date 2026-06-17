{ self, inputs, ... }:
{
  flake.nixosConfigurations.flow = inputs.nixpkgs.lib.nixosSystem
  {
    modules = 
    [
      self.nixosModules.flowConfiguration
      inputs.home-manager.nixosModules.home-manager
    ];
  };
}

