command --query timg || exit

function timg
    set --local count 0

    for arg in $argv
        if test -f $arg && file -b --mime-type $arg | string match --quiet "image/*"
            set count (math $count + 1)
        end
    end

    # Enable grid automatically
    test $count -gt 1 && set --prepend argv --grid $count

    # Read pipe automatically
    if ! isatty && test "$argv[-1]" != - && ! test -f "$argv[-1]"
        set --append argv -
    end

    command timg $argv
end
