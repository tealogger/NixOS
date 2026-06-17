function nxrs --wraps='sudo nixos-rebuild switch --flake ./NixOS' --description 'alias nxrs=sudo nixos-rebuild switch --flake ./NixOS'
    sudo nixos-rebuild switch --flake ./NixOS $argv
end
