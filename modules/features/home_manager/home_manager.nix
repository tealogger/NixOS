{ self, inputs, ... }:
{
  flake.nixosModules.home_manager = { pkgs, ... }:
  {
    imports =
    [
      inputs.home-manager.nixosModules.default
    ];

    home-manager =
    {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };

}
