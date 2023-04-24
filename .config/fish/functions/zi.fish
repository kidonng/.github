command --query zoxide
and command --query fzf
or exit

function zi --description "zoxide + fzf"
    set --local dir (
        zoxide query --list -- $argv |
        string replace ~ "~" |
        fzf \
            --exit-0 \
            --select-1 \
            --preview "$fzf_preview_dir_cmd (string replace '~' ~ -- {})" |
        string replace "~" ~
    )
    test -n "$dir" && cd $dir
end
