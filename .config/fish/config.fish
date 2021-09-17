set -l plug $plug_path/kidonng/plug.fish/functions/plug.fish
test -f $plug && source $plug && plug init

status -i || exit

# https://github.com/IlanCosman/tide/issues/157#issuecomment-902111672
set -q fish_parent_private_mode && set -u fish_parent_private_mode $fish_parent_private_mode
set -q fish_private_mode && set -x fish_parent_private_mode $fish_private_mode

if command -sq zoxide
    function _zoxide_hook -v PWD
        zoxide add $PWD
    end
end
