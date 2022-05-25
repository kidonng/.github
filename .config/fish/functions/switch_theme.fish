function switch_theme
    if test "$BAT_THEME" = "Tokyo Night Day"
        set -f theme dark
        set -f dark true
        set -Ux BAT_THEME "Tokyo Night Storm"
    else
        set -f theme light
        set -f dark false
        set -Ux BAT_THEME "Tokyo Night Day"
    end

    command -sq vivid && set -Ux LS_COLORS (vivid generate $BAT_THEME)

    if command -sq fzf
        set -l fzf_opt --color=$theme,gutter:-1

        if set index (contains -i -- (string match -- "--color*" $FZF_DEFAULT_OPTS) $FZF_DEFAULT_OPTS)
            set FZF_DEFAULT_OPTS[$index] $fzf_opt
        else
            set -a FZF_DEFAULT_OPTS $fzf_opt
        end
    end

    command -sq kitty && kitty +kitten themes --cache-age 9999 $BAT_THEME

    command -sq osascript && osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to '$dark
end
