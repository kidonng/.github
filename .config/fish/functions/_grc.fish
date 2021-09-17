set -l cmd (string replace .fish "" (status basename))

if ! command -sq grc || ! command -sq $cmd
    exit
end

function $cmd -V cmd -d "$cmd + grc"
    grc $cmd $argv
end
