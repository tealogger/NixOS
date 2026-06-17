{ self, inputs, ... }:
{
    flake.homeModules.kitty = { pkgs, lib, config, ... }:
    {
        xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/modules/features/kitty";
    };
}
