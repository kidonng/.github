test (uname) = Darwin || exit

function unpkg --description "Unpack .pkg files"
    set --local tmp (mktemp -d -t unpkg)

    for pkg in $argv
        set --local pkgdir $tmp/$pkg
        pkgutil --expand $pkg $pkgdir

        set --local unpacked $pkg.unpacked
        mkdir -p $unpacked

        for i in $pkgdir/*.pkg
            tar xzf $i/Payload -C $unpacked
        end
    end

    rm -r $tmp
end
