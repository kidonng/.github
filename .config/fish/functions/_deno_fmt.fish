command --query deno
and command --query bat
or exit

set --local cmd (status basename | path change-extension "")

function $cmd --wraps bat --description "Format "(string upper $cmd)" with highlight" --inherit-variable cmd
    if isatty
        deno fmt --ext $cmd - <$argv[-1] | bat --language $cmd $argv[..-2]
    else
        deno fmt --ext $cmd - | bat --language $cmd $argv
    end
end
