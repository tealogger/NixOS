{ self, inputs, ... }: {

  flake.nixosModules.flowHardware = { config, lib, pkgs, modulesPath, ... }:
  {
	imports =
		[ (modulesPath + "/installer/scan/not-detected.nix")
		];

	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-amd" "ntsync" ];
	boot.extraModulePackages = [ ];
	boot.kernelParams = [ "amdgpu.dcdebugmask=0x410" ];

	fileSystems."/" =
	{ device = "/dev/mapper/luks-ed3a4612-b6f0-4009-9b2a-1e6f3316cfd3";
	fsType = "ext4";
	};

	boot.initrd.luks.devices."luks-ed3a4612-b6f0-4009-9b2a-1e6f3316cfd3".device = "/dev/disk/by-uuid/ed3a4612-b6f0-4009-9b2a-1e6f3316cfd3";

	fileSystems."/boot" =
	{ device = "/dev/disk/by-uuid/EBE9-3E42";
	fsType = "vfat";
	options = [ "fmask=0077" "dmask=0077" ];
	};

	swapDevices = [{
		device = "/var/lib/swapfile";
		size = 16*1024;
	}];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

}
