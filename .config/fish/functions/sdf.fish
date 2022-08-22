if ! command --query sd || ! command --query fzf
    exit
end

# Inspired by https://github.com/ms-jpq/sad
function sdf --wraps sd --description "sd + fzf"
    set --local index (contains --index -- -- $argv || echo 0)
    set --local count (math $index + 3)
    set --local args $argv[..(math $count - 1)]

    if test (count $argv) -lt $count
        sd $argv
        return
    end

    set --local files

    for file in $argv[$count..]
        echo Processing (set_color -o)$file(set_color normal)
        test -d $file && continue
        command diff $file (sd -p $args $file | psub) >/dev/null || set --append files $file
    end

    set --local preview "diff -u {} (sd -p $args {} | psub)"
    command --query delta && set preview "$preview | delta"

    set --local selection (
        printf "%s\n" $files |
        fzf --multi --preview $preview
    ) && sd $args $selection
end
