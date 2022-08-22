if test (uname) != Darwin || ! command --query fzf || ! functions --query _fzf_preview_file
    exit
end

function mdf --wraps mdfind --description "mdfind + fzf"
    if ! set --query argv[1]
        echo mdf: no query specified >&2
        return 1
    end

    set --local selection (
        mdfind $argv |
        fzf --multi --preview "_fzf_preview_file {}"
    )

    set --query selection[1] && printf "%s\n" $selection
end
