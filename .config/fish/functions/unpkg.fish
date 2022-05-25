command -sq 7z || exit

function unpkg -a file -d "Unpack .pkg files"
    set -l tmp (mktemp -d)
    7z x $file -o$tmp

    for pkg in $tmp/*.pkg
        7z x $pkg/Payload -o$pkg
        7z x $pkg/Payload~ -o.
    end

    rm -r $tmp
end
