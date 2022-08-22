command --query fzf || exit

function fzf
    # Preview on the bottom when screen is too narrow
    if test "$COLUMNS" -lt 75
        set --local index (contains --index -- --preview-window $FZF_DEFAULT_OPTS)
        set --function --export FZF_DEFAULT_OPTS \
            $FZF_DEFAULT_OPTS[..$index] \
            bottom:8:wrap \
            $FZF_DEFAULT_OPTS[(math $index + 2)..]
    end

    command fzf $argv
end
