command -sq openssl || exit

function sha256sum -d "Print SHA-256 checksum"
    if isatty stdout
        openssl sha256 $argv
    else
        printf "%b" (
            if isatty
                openssl sha256 $argv | string split -f 2 " "
            else
                openssl sha256
            end | string join "\n"
        )
    end
end
