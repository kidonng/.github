command --query openssl || exit

set --local type (status basename | path change-extension "")

function $type --description "Print $type checksum" --inherit-variable type
    set --local cmd openssl $type $argv

    if isatty && ! isatty stdout
        $cmd | string split --fields 2 " "
    else
        $cmd
    end
end
