function toggle_themes --description "Toggle light and dark themes"
    if test "$BAT_THEME" = "Tokyo Night Day"
        set --function theme dark
        set --function dark true
        set --universal --export BAT_THEME "Tokyo Night Storm"
    else
        set --function theme light
        set --function dark false
        set --universal --export BAT_THEME "Tokyo Night Day"
    end

    command --query vivid && set --universal --export LS_COLORS (vivid generate $BAT_THEME)

    if command --query fzf
        set --local fzf_opt --color=$theme,gutter:-1

        if set index (contains --index -- (string match -- "--color*" $FZF_DEFAULT_OPTS) $FZF_DEFAULT_OPTS)
            set FZF_DEFAULT_OPTS[$index] $fzf_opt
        else
            set --append FZF_DEFAULT_OPTS $fzf_opt
        end
    end

    command --query kitty && kitty +kitten themes --cache-age 9999 $BAT_THEME

    test (uname) = Darwin && osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to '$dark
end
