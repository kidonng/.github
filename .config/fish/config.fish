if set -q plug_path
    set -l fish fish-shell/fish-shell
    test -d $plug_path/$fish && set -ga --path plug_enabled $fish
    source $plug_path/kidonng/plug.fish/functions/plug.fish
    plug init
end

status -i || exit

# Meta + Z
bind \e\[122\;9u undo
# Meta + Shift + Z
bind \e\[122\;10u redo
# Meta + Left
bind \e\[1\;9D beginning-of-line
# Meta + Right
bind \e\[1\;9C end-of-line
# Meta + /
bind \e\[47\;9u __fish_toggle_comment_commandline

# Replace __fish_list_current_token
if functions -q _fzf_search_directory
    bind \el "fzf_fd_opts=--exact-depth=1 _fzf_search_directory"
    bind \eL "begin; set -lx fzf_fd_opts --exact-depth 1 -H; _fzf_search_directory; end"
end

# set -uq fish_private_mode && set -x fish_private_mode $fish_private_mode
for path in ~/.local/bin ~/.deno/bin /usr/local/opt/{curl,ffmpeg@4}/bin /usr/local/sbin
    test -e $path && set -ga fish_user_paths $path
end

if set -q KITTY_INSTALLATION_DIR
    set -g KITTY_SHELL_INTEGRATION no-cursor no-title
    set -l dir $KITTY_INSTALLATION_DIR/shell-integration/fish

    source $dir/vendor_conf.d/kitty-shell-integration.fish
    set -p fish_complete_path $dir/vendor_completions.d
end

if command -sq zoxide
    set -g pwdprev $PWD

    function _zoxide -v PWD
        test $PWD = $pwdprev && return
        set pwdprev $PWD
        zoxide add $PWD
    end
end
