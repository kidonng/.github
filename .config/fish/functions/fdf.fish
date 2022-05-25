if ! command -sq fd || ! command -sq fzf || ! functions -q _fzf_preview_file
    exit
end

function fdf -w fd -d "fd + fzf"
    test (count $argv) -lt 2 && set -p argv --strip-cwd-prefix
    set -l selection (
        fd --color always $argv |
        fzf --ansi -m --preview "_fzf_preview_file {}"
    )

    set -q selection[1] && printf "%s\n" $selection
end
