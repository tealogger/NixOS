{ self, inputs, ... }: 
{

  flake.nixosModules.flowConfiguration = { pkgs, lib, ... }: 
  {
    imports = 
    [
      self.nixosModules.flowHardware
      self.nixosModules.kde
      self.nixosModules.services
      self.nixosModules.limine
      self.nixosModules.programs
      self.nixosModules.fonts
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.hostName = "flow";

	time.timeZone = "Asia/Kuala_Lumpur";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings =
	{
		LC_ADDRESS = "en_GB.UTF-8";
		LC_IDENTIFICATION = "en_GB.UTF-8";
		LC_MEASUREMENT = "en_GB.UTF-8";
		LC_MONETARY = "en_GB.UTF-8";
		LC_NAME = "en_GB.UTF-8";
		LC_NUMERIC = "en_GB.UTF-8";
		LC_PAPER = "en_GB.UTF-8";
		LC_TELEPHONE = "en_GB.UTF-8";
		LC_TIME = "en_GB.UTF-8";
	};

	services.xserver.xkb =
	{
		layout = "us";
		variant = "";
	};

	users.users.tq =
	{
		isNormalUser = true;
		description = "tq";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.fish;
		packages = with pkgs;
		[

		];
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11";
  };

}
