if ! command -sq prettier || ! command -sq bat
    exit
end

set -l cmd (string replace .fish "" (status basename))

function $cmd -w bat -d "prettier + bat "(string upper $cmd) -V cmd
    if isatty
        prettier --parser $cmd $argv[-1] | bat -l $cmd $argv[..-2]
    else
        prettier --parser $cmd | bat -l $cmd $argv
    end
end
