if ! command -sq zoxide || ! command -sq fzf
    exit
end

function zi -d "zoxide + fzf"
    set -l dir (
        zoxide query -l -- $argv |
        string replace $HOME "~" |
        fzf -0 -1 --preview "$fzf_preview_dir_cmd (string replace '~' $HOME -- {})" |
        string replace "~" $HOME
    )
    test -n "$dir" && cd $dir
end
