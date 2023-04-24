command --query fzf || exit

function fzf
    set --function --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS

    # Preview on the bottom when screen is too narrow
    if test "$COLUMNS" -lt 75
        set --local index (contains --index -- --preview-window $FZF_DEFAULT_OPTS)
        set FZF_DEFAULT_OPTS[(math $index + 1)] bottom:(math "round($LINES / 3)"):wrap
    end

    command fzf $argv
end
