set --local cmd (status basename | path change-extension "")

command --query grc
and command --query $cmd
or exit

function $cmd --description "$cmd + grc" --inherit-variable cmd
    grc $cmd $argv
end
