if ! command --query prettier || ! command --query bat
    exit
end

set --local cmd (status basename | path change-extension "")

function $cmd --wraps bat --description "Format "(string upper $cmd)" with highlight" --inherit-variable cmd
    if isatty
        prettier --parser $cmd $argv[-1] | bat --language $cmd $argv[..-2]
    else
        prettier --parser $cmd | bat --language $cmd $argv
    end
end
