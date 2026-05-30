{ self, inputs, ... }: 
{
  flake.nixosModules.kde = { pkgs, lib, ... }:
  {
    services.displayManager.plasma-login-manager.enable = true;
	services.desktopManager.plasma6.enable = true;
  };
}
