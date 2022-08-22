set --local cmd (status basename | path change-extension "")

if ! command --query grc || ! command --query $cmd
    exit
end

function $cmd --description "$cmd + grc" --inherit-variable cmd
    grc $cmd $argv
end
