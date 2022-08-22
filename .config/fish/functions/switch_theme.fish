function switch_theme
    if test "$BAT_THEME" = "Tokyo Night Day"
        set --function theme dark
        set --function dark true
        set -Ux BAT_THEME "Tokyo Night Storm"
    else
        set --function theme light
        set --function dark false
        set -Ux BAT_THEME "Tokyo Night Day"
    end

    command --query vivid && set -Ux LS_COLORS (vivid generate $BAT_THEME)

    if command --query fzf
        set --local fzf_opt --color=$theme,gutter:-1

        if set index (contains --index -- (string match -- "--color*" $FZF_DEFAULT_OPTS) $FZF_DEFAULT_OPTS)
            set FZF_DEFAULT_OPTS[$index] $fzf_opt
        else
            set --append FZF_DEFAULT_OPTS $fzf_opt
        end
    end

    command --query kitty && kitty +kitten themes --cache-age 9999 $BAT_THEME

    command --query osascript && osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to '$dark
end
