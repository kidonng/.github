function curl
    # Do matching ourselves as `argparse --ignore-unknown` has known limitations
    if ! string match --regex --quiet -- "^-\w*[Oo]" $argv &&
            ! contains -- --output $argv &&
            ! contains -- --remote-name $argv
        if isatty stdout
            # Include headers
            set --prepend argv --include
        else
            set --prepend argv --silent --show-error
        end
    end

    command curl $argv
end
