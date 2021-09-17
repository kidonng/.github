if ! functions -q _fzf_search_directory
    source $__fish_data_dir/functions/__fish_list_current_token.fish
    exit
end

function __fish_list_current_token
    fzf_fd_opts=--exact-depth=1 _fzf_search_directory
end
