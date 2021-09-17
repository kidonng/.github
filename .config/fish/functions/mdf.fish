if test (uname) != Darwin || ! command -sq fzf || ! functions -q _fzf_preview_file
    exit
end

function mdf -w mdfind -d "mdfind + fzf"
    if ! set -q argv[1]
        echo mdf: no query specified >&2
        return 1
    end

    set -l selection (
        mdfind $argv |
        fzf -m --preview "_fzf_preview_file {}"
    )

    set -q selection[1] || return

    if status -c
        echo $selection
    else
        commandline -i -- (string escape -- $selection | string join ' ')
    end
end
