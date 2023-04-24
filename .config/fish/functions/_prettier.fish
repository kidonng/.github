command --query prettier
and command --query bat
or exit

set --local cmd (status basename | path change-extension "")

function $cmd --wraps bat --description "Format "(string upper $cmd)" with highlight" --inherit-variable cmd
    if isatty
        set --function prettier_arg $argv[-1]
        set --function bat_arg $argv[..-2]
    else
        set --function bat_arg $argv
    end

    prettier --parser $cmd $prettier_arg | bat --language $cmd $bat_arg
end
