command --query bat || exit

function bat
    test "$argv[1]" = cache || set --prepend argv --italic-text always

    command bat \
        --map-syntax "*.astro:HTML" \
        --map-syntax "*.njk:HTML" \
        $argv
end
