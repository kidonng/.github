function du
    # Display total size if more than one file
    test (string match --invert -- "-*" $argv | count) -gt 1 && set --prepend argv -c

    if command --query grc
        grc du $argv
    else
        command du $argv
    end
end
