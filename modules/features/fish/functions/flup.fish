function flup --wraps='sudo nix flake update --flake ./NixOS' --description 'alias flup=sudo nix flake update --flake ./NixOS'
    sudo nix flake update --flake ./NixOS $argv
end
