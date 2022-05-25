if ! command -sq rg || ! command -sq fzf || ! command -sq bat
    exit
end

# Based on https://github.com/junegunn/fzf/issues/1598#issuecomment-719573480
function rgf -w rg -d "ripgrep + fzf"
    set -q argv[1] || set argv ""
    set -l selection (
        rg --color always -n $argv |
        fzf --ansi -m -d : \
            --with-nth 1,3 \
            --preview "bat --style header,numbers --color always --highlight-line {2} {1}" \
            --preview-window ~1:+{2}-/2 |
        string split -f 1 :
    )

    set -q selection[1] && printf "%s\n" $selection
end
