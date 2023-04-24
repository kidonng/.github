command --query npm
and command --query jq
or exit

function npm
    contains -- $argv[1] start test && set --prepend argv run

    set --local cmd $argv[1]
    set --local name $argv[2]

    # Faster `npm run`
    if test "$cmd" = run && test -n "$name"
        if set --local package (find_up package.json)
            set --local script (jq --raw-output .scripts.$name $package | string replace --all "*" "\*")

            if test $script != null
                set --local --export --append PATH (path resolve $package/../node_modules/.bin)
                eval $script $argv[3..]
                return
            else
                echo Script "'$name'" not found >&2
                return 1
            end
        end
    end

    command npm $argv
end
