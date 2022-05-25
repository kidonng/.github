command -sq openssl || exit

set -l type (string replace .fish "" (status basename))

function $type -d "Print $type checksum" -V type
    set -l cmd openssl $type $argv

    if isatty && ! isatty stdout
        $cmd | string split -f 2 " "
    else
        $cmd
    end
end
