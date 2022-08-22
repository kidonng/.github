set --local bin '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'
test -x $bin || exit

function code --inherit-variable bin
    # Read pipe automatically
    if ! isatty && test "$argv[-1]" != -
        set --append argv -
    end

    $bin $argv
end
