command -sq exa || exit

function exa
    set -p argv --group-directories-first --git

    if isatty stdout
        command exa $argv
    else
        # COLUMNS=1: https://github.com/ogham/exa/issues/879#issuecomment-845233451
        # --color never: https://github.com/ogham/exa/issues/955
        COLUMNS=1 command exa --color never $argv
    end
end
