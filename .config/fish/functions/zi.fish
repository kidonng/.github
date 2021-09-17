if ! command -sq zoxide || ! command -sq fzf
    exit
end

function zi -d "cd + zoxide query -i"
    set dir (zoxide query -i -- $argv) && cd $dir
end
