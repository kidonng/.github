command -sq exa || exit

function exa
    set -p argv --group-directories-first --git

    if isatty stdout
        command exa $argv
    else
        # https://github.com/ogham/exa/issues/955
        set -p argv --color never
        # https://github.com/ogham/exa/issues/879#issuecomment-845233451
        COLUMNS=1 command exa $argv
    end
end
