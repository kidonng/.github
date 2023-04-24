command --query exa || exit

function exa
    if isatty stdout
        set --prepend argv --icons
    else
        # https://github.com/ogham/exa/issues/879#issuecomment-845233451
        set --function --export COLUMNS 1
        # https://github.com/ogham/exa/issues/955
        set --prepend argv --color never
    end

    command exa --group-directories-first --git $argv
end
