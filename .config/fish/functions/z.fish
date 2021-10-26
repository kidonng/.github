command -sq zoxide || exit

function z -d "cd + zoxide"
    switch "$argv"
        case "" -
            cd $argv
        case "*"
            if test -d $argv
                cd $argv
            else
                set dir (zoxide query --exclude $PWD -- $argv) && cd $dir
            end
    end
end
