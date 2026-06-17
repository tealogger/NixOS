{ self, inputs, ... }:
{
    flake.homeModules.zed = { pkgs, lib, config, ... }:
    {
        xdg.configFile."zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/modules/features/zed";
    };
}
