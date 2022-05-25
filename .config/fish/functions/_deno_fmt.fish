if ! command -sq deno || ! command -sq bat
    exit
end

set -l cmd (string replace .fish "" (status basename))

function $cmd -w bat -d "deno fmt + bat "(string upper $cmd) -V cmd
    if isatty
        deno fmt --ext $cmd - <$argv[-1] | bat -l $cmd $argv[..-2]
    else
        deno fmt --ext $cmd - | bat -l $cmd $argv
    end
end
