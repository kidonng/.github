set -l cmd (string replace .fish "" (status basename))

if ! command -sq grc || ! command -sq $cmd
    exit
end

function $cmd -d "$cmd + grc" -V cmd
    grc $cmd $argv
end
