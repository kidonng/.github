command --query eza || exit

function eza
    if isatty stdout
        set --prepend argv --icons
    else
        # https://github.com/ogham/exa/issues/879#issuecomment-845233451
        set --function --export COLUMNS 1
        # https://github.com/ogham/exa/issues/955
        set --prepend argv --color never
    end

    command eza --group-directories-first --git $argv
end
