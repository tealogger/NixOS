{ self, inputs, ... }:
{
    flake.homeModules.gkt4 = { pkgs, lib, config, ... }:
    {
        xdg.configFile."gtk-4.0".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/modules/features/gtk-4.0";
    };
}
