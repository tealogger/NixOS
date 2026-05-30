{ self, inputs, ... }: 
{
  flake.nixosModules.services = { pkgs, lib, ... }:
  {
    networking.networkmanager.enable = true;

    networking =
    {
		nameservers = [ "9.9.9.9" ];
		networkmanager.dns = "none";
	};

    hardware.bluetooth =
    {
		enable = true;
		powerOnBoot = false;
		settings =
		{
			General =
			{
				Experimental = true;
			};
		};
	};
	hardware.enableAllFirmware = true;

    services.printing.enable = true;

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire =
	{
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

#	services.asusd.enable = true;

#	networking.enableIPv6 = false;

	services.handheld-daemon =
	{
		user = "tq";
		enable = true;
		adjustor.enable = true;
		adjustor.loadAcpiCallModule = true;
		ui.enable = true;
	};
	services.power-profiles-daemon.enable = false;
  };
}
