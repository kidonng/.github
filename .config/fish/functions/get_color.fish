function get_color --description "Get terminal color"
    set --query argv[1] || set argv (set_color -c)

    for color in $argv
        echo (set_color -b $color)"     "(set_color normal) (set_color -o $color)$color(set_color normal)
    end
end
