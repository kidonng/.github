command --query zoxide || exit

function z --description "cd + zoxide"
    switch "$argv"
        case "" -
            cd $argv
        case "*"
            if test -d "$argv"
                cd $argv
            else
                set --local dir (zoxide query --exclude $PWD -- $argv) && cd $dir
            end
    end
end
