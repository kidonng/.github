if set -q plug_path
    set -l fish fish-shell/fish-shell
    test -d $plug_path/$fish && set -ga --path plug_enabled $fish
    source $plug_path/kidonng/plug.fish/functions/plug.fish
    plug init
end

status -i || exit

bind \t _complete
# Meta + Z
bind \e\[122\;9u undo
# Meta + Shift + Z
bind \e\[122\;10u redo
# Meta + /
bind \e\[47\;9u __fish_toggle_comment_commandline

set -uq fish_private_mode && set -x fish_private_mode $fish_private_mode

if command -sq zoxide
    set -g pwdprev $PWD

    function _zoxide -v PWD
        test $PWD = $pwdprev && return
        set pwdprev $PWD
        zoxide add $PWD
    end
end
