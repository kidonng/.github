function tar
    # Verbose listing
    if set --local index (contains --index -- --list $argv)
        set argv $argv[..$index] -v $argv[(math $index + 1)..]
    end

    command tar $argv
end
