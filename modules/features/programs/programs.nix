{ self, inputs, ... }: 
{
	flake.nixosModules.programs = { pkgs, lib, ... }:
	{
		nixpkgs.config.allowUnfree = true;

		environment.systemPackages = with pkgs;
		[
			#Internet
			librewolf
			vesktop
			proton-vpn
			ungoogled-chromium
			telegram-desktop

			#Media
			gapless
			kdePackages.kolourpaint
			haruna
			obs-studio

			#Editors
			kdePackages.kate
			zed-editor

			#Utilities
			kitty
			kdePackages.plasma-keyboard
			kdePackages.kbackup
			solaar
			gparted

			#Games
			prismlauncher
			mangohud
			mangojuice

			#System
			sbctl

			#Misc
			cmatrix
			btop
			cava
			fastfetch

			#Productivity
			weka
			onlyoffice-desktopeditors
		];

		programs.git.enable = true;
		programs.fish.enable = true;
		programs.gamemode.enable = true;
		programs.steam =
		{
			enable = true;

			extraCompatPackages = with pkgs;
			[
				proton-ge-bin
				kdePackages.breeze
			];
		};
	};
}
