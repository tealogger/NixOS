{ self, inputs, ... }:
{
  flake.nixosModules.cachyos_kernel = { pkgs, lib, ... }:
  {
    nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.default ];
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

    nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
    nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
  };
}
