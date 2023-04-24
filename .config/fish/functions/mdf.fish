test (uname) = Darwin
and command --query fzf
and functions --query _fzf_preview_file
or exit

function mdf --wraps mdfind --description "mdfind + fzf"
    if ! set --query argv[1]
        echo mdf: no query specified >&2
        return 1
    end

    set --local selection (
        mdfind $argv |
        fzf \
            --multi \
            --preview "_fzf_preview_file {}"
    )

    set --query selection[1] && printf %s\n $selection
end
