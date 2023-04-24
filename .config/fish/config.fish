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

# set --unexport --query fish_private_mode && set --export fish_private_mode $fish_private_mode
for path in ~/.local/bin /usr/local/opt/node@18/bin /usr/local/sbin
    test -e $path && set --global --append fish_user_paths $path
end

if set --query KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION no-cursor no-title
    set --local dir $KITTY_INSTALLATION_DIR/shell-integration/fish

    source $dir/vendor_conf.d/kitty-shell-integration.fish
    set --prepend fish_complete_path $dir/vendor_completions.d
end

if command --query zoxide
    set --global pwdprev $PWD

    function _zoxide --on-variable PWD
        test $PWD = $pwdprev && return
        set pwdprev $PWD
        zoxide add $PWD
    end
end
