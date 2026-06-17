{ self, inputs, ... }:
{
    flake.homeModules.fish = { pkgs, lib, config, ... }:
    {
        xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/modules/features/fish";
    };
}
