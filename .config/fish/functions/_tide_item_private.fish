function _tide_item_private
    set -q tide_private_color || set -lx tide_private_color white
    set -q tide_private_bg_color || set -lx tide_private_bg_color normal
    set -q tide_private_icon || set -l tide_private_icon 

    test -n "$fish_parent_private_mode" && _tide_print_item private $tide_private_icon' '
end
