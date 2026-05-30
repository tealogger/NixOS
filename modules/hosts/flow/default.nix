{ self, inputs, ... }: 
{
  flake.nixosConfigurations.flow = inputs.nixpkgs.lib.nixosSystem {
    modules = 
    [
      self.nixosModules.flowConfiguration
    ];
  };
}
