function _tide_item_nix_shell
    set -q tide_nix_color || set -lx tide_nix_color blue
    set -q tide_nix_bg_color || set -lx tide_nix_bg_color normal
    set -q tide_nix_icon || set -l tide_nix_icon 

    set -q IN_NIX_SHELL && _tide_print_item nix $tide_nix_icon' ' $IN_NIX_SHELL
end
