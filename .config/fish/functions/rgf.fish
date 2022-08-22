command --query rg
and command --query fzf
and command --query bat
or exit

# Based on https://github.com/junegunn/fzf/issues/1598#issuecomment-719573480
function rgf --wraps rg --description "ripgrep + fzf"
    set --query argv[1] || set argv ""
    set --local selection (
        rg --color always --line-number $argv |
        fzf --ansi --multi --exit-0 --delimiter : \
            --with-nth 1,3 \
            --preview "bat --style header,numbers --color always --highlight-line {2} {1}" \
            --preview-window ~1:+{2}-/2 |
        string split --fields 1 :
    )

    set --query selection[1] && printf "%s\n" $selection
end
