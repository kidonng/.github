command --query deno
and command --query bat
or exit

set --local cmd (status basename | path change-extension "")

function $cmd --wraps bat --description "Format "(string upper $cmd)" with highlight" --inherit-variable cmd
    if isatty
        set --function bat_arg $argv[..-2]
        deno fmt --ext $cmd - <$argv[-1]
    else
        set --function bat_arg $argv
        deno fmt --ext $cmd -
    end | bat --language $cmd $bat_arg
end
