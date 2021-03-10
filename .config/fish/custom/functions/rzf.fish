# Based on https://github.com/junegunn/fzf/issues/1598#issuecomment-719573480
function rzf
    rg --color=always --line-number --smart-case "$argv" |
    fzf --ansi --delimiter : \
      --with-nth=1,3 \
      --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
      --preview-window +{2}-/2 |
    string split : -f 1
end
