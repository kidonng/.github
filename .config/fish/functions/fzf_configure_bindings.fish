function fzf_configure_bindings
    # DO NOT move this before the function
    command --query fzf || return

    bind \cf _fzf_search_directory
    bind \e\cf '
        fzf_fd_opts=--hidden \
        fzf_preview_dir_cmd="$fzf_preview_dir_cmd --all" \
        _fzf_search_directory
    '

    bind \cr 'fzf_history_opts=--with-nth=4.. _fzf_search_history'
    bind \e\cr _fzf_search_history

    bind \cv $_fzf_search_vars_command
    bind \e\cl _fzf_search_git_log
    bind \e\cs _fzf_search_git_status
    bind \cp _fzf_search_processes

    # VSCode bind Alt+Right to Alt+f by default
    set --local append_key (test "$TERM_PROGRAM" = vscode && echo \eF || echo \ef)
    bind $append_key 'fish_commandline_append " &| fzf --multi"'
end
