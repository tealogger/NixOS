{ self, inputs, ... }: 
{
	flake.nixosModules.limine = { pkgs, lib, ... }:
  {
	boot.loader =
    {
		limine =
		{
			enable = true;
			secureBoot.enable = true;
			style =
			{
				wallpapers =
				[
						../wallpapers/wallhaven-gw2mel.png
				];

				wallpaperStyle = "centered";

				interface.branding = "I use Nixos BTW!!!";
			};
			extraEntries =
			"
			/Windows
				protocol: efi
				path: uuid(7c31070f-a6d5-416b-b500-5d797af7fe82):/EFI/Microsoft/Boot/bootmgfw.efi
			";
		};
		efi.canTouchEfiVariables = true;
    };
  };
}
