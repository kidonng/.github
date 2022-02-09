command -sq exa || exit

function exa
    set -p argv --group-directories-first --git
    # COLUMNS=1: https://github.com/ogham/exa/issues/879#issuecomment-845233451
    # --color never: https://github.com/ogham/exa/issues/955
    isatty stdout || set -lx COLUMNS 1 || set -p argv --color never

    command exa $argv
end
