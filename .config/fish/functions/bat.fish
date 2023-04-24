command --query bat || exit

function bat
    if test "$argv[1]" != cache
        set --prepend argv \
            --italic-text always \
            --map-syntax "*.astro:TypeScriptReact"
    end

    command bat $argv
end
