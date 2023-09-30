fish_add_path --global \
    ~/.local/bin \
    /usr/local/opt/node@18/bin \
    /usr/local/sbin

if set --query plug_path
    source $plug_path/kidonng/plug.fish/functions/plug.fish
    plug init
end

status is-interactive || exit

# Meta + Z
bind \e\[122\;9u undo
# Meta + Shift + Z
bind \e\[122\;10u redo
# Meta + Left
bind \e\[1\;9D beginning-of-line
# Meta + Right
bind \e\[1\;9C end-of-line
# Meta + /
# bind \e\[47\;9u __fish_toggle_comment_commandline

# Replace __fish_list_current_token
if functions --query _fzf_search_directory
    bind \el "
        fzf_fd_opts=(printf %s\n --exact-depth=1 --no-ignore) \
        _fzf_search_directory
    "
    bind \eL "
        fzf_fd_opts=(printf %s\n --exact-depth=1 --no-ignore --hidden) \
        _fzf_search_directory
    "
end

if command --query zoxide
    set --global pwdprev $PWD

    function _zoxide --on-variable PWD
        test $PWD = $pwdprev && return
        set pwdprev $PWD
        zoxide add $PWD
    end
end
