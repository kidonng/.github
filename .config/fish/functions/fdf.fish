if ! command --query fd || ! command --query fzf || ! functions --query _fzf_preview_file
    exit
end

function fdf --wraps fd --description "fd + fzf"
    test (count $argv) -lt 2 && set --prepend argv --strip-cwd-prefix
    set --local selection (
        fd --color always $argv |
        fzf --ansi --multi --exit-0 --preview "_fzf_preview_file {}"
    )

    set --query selection[1] && printf "%s\n" $selection
end
