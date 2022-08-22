command --query zoxide
and command --query fzf
or exit

function zi --description "zoxide + fzf"
    set --local dir (
        zoxide query --list -- $argv |
        string replace $HOME "~" |
        fzf --exit-0 -select-1 --preview "$fzf_preview_dir_cmd (string replace '~' $HOME -- {})" |
        string replace "~" $HOME
    )
    test -n "$dir" && cd $dir
end
