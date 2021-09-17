if ! command -sq fd || ! command -sq fzf || ! functions -q _fzf_preview_file
    exit
end

function fdf -w fd -d "fd + fzf"
    set -l selection (
        fd --color always $argv |
        fzf --ansi -m --preview "_fzf_preview_file {}"
    )

    set -q selection[1] || return

    if status -c
        echo $selection
    else
        commandline -i -- (string escape -- $selection | string join ' ')
    end
end
