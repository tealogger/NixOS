{ self, inputs, ... }: 
{
  flake.nixosModules.fonts = { pkgs, lib, ... }:
  {
		fonts.packages = with pkgs;
		[
			nerd-fonts.jetbrains-mono
			nerd-fonts.departure-mono
		];
  };
}
