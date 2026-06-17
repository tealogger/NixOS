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
	boot.kernelParams = [ "amdgpu.dcdebugmask=0x400" ];

	fileSystems."/" =
		{ device = "/dev/mapper/luks-09706245-93cd-4072-a080-c0f1fe81dc57";
		fsType = "ext4";
		};

	boot.initrd.luks.devices."luks-09706245-93cd-4072-a080-c0f1fe81dc57".device = "/dev/disk/by-uuid/09706245-93cd-4072-a080-c0f1fe81dc57";

	fileSystems."/boot" =
		{ device = "/dev/disk/by-uuid/6801-6098";
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
