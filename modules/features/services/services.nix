{ self, inputs, ... }: 
{
  flake.nixosModules.services = { pkgs, lib, ... }:
  {
    networking.networkmanager.enable = true;
    services.resolved.enable = true;

    hardware.bluetooth =
    {
		enable = true;
		powerOnBoot = false;
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

	services.handheld-daemon =
	{
		user = "tq";
		enable = true;
		ui.enable = true;
		adjustor.enable = true;
		adjustor.loadAcpiCallModule=true;
	};
	services.power-profiles-daemon.enable = false;
  };
}
