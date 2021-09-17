command -sq exa || exit

function exa
    set -p argv --group-directories-first --git

    # https://github.com/ogham/exa/issues/879#issuecomment-845233451
    if isatty stdout
        command exa $argv
    else
        set -p argv --color never
        COLUMNS=1 command exa $argv
    end
end
