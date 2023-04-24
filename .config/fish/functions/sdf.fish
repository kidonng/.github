command --query sd
and command --query fzf
or exit

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

    command --query delta && set --local delta "| delta"

    set --local selection (
        printf %s\n $files |
        fzf \
            --multi \
            --preview "diff -u {} (sd -p $args {} | psub) $delta"
    ) && sd $args $selection
end
