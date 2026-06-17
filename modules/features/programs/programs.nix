{ self, inputs, ... }: 
{
	flake.nixosModules.programs = { pkgs, lib, ... }:
	{
		nixpkgs.config.allowUnfree = true;

		environment.systemPackages = with pkgs;
		[
			#Internet
			brave
			vesktop
			proton-vpn
			telegram-desktop

			#Media
			gapless
			kdePackages.kolourpaint
			haruna
			obs-studio
			drawy

			#Editors
			kdePackages.kate

			#Utilities
			kitty
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

			#Development
			devenv
			vscode
			zed-editor
		];

		programs.nix-ld.enable = true;
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
