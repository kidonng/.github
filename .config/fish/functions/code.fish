command --query code || exit

function code
    # Read pipe automatically
    if ! isatty && test "$argv[-1]" != -
        set --append argv -
    end

    command code $argv
end
