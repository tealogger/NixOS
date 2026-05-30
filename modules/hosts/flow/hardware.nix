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
		{ device = "/dev/mapper/luks-0aac0f6e-ffe7-41b2-8753-7fa25c8e41bb";
		fsType = "ext4";
		};

	boot.initrd.luks.devices."luks-0aac0f6e-ffe7-41b2-8753-7fa25c8e41bb".device = "/dev/disk/by-uuid/0aac0f6e-ffe7-41b2-8753-7fa25c8e41bb";

	fileSystems."/boot" =
		{ device = "/dev/disk/by-uuid/62F8-D3E5";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
		};

	swapDevices = [{
		device = "/var/lib/swapfile";
		size = 68*1024; #
	}];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

}
