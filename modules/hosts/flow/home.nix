{ self, inputs, ... }:
{
  flake.homeConfigurations.tq = inputs.home-manager.lib.homeManagerConfiguration
  {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules =
    [
      self.homeModules.tq_home
    ];
  };


  flake.homeModules.tq_home = { pkgs, ... }:
  {
    imports =
    [
        self.homeModules.kitty
        self.homeModules.fish
        self.homeModules.gkt4
        self.homeModules.zed
    ];

    home.username = "tq";
    home.homeDirectory = "/home/tq";
    home.stateVersion = "26.05";
  };

}
