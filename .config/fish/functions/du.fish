function du
    test (count (string match --invert -- "-*" $argv)) -gt 1 && set --prepend argv --total

    if command --query grc
        grc du $argv
    else
        command du $argv
    end
end
