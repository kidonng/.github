command --query npx || exit

function npx
    set --local bin (find_up node_modules)/.bin/$argv[1]

    # Faster `npx`
    if test -e $bin
        $bin $argv[2..]
    else
        command npx --yes $argv
    end
end
