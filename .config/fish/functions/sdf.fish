command -sq sd || exit

# Inspired by https://github.com/ms-jpq/sad
function sdf -w sd -d "sd + fzf"
    set -l index (contains -i -- -- $argv || echo 0)
    set -l count (math $index + 3)
    set -l args $argv[..(math $count - 1)]

    if test (count $argv) -lt $count
        sd $argv
        return
    end

    set -l files

    for file in $argv[$count..]
        test -d $file && continue
        command diff $file (sd -p $args $file | psub) >/dev/null || set -a files $file
    end

    set -l preview "diff -u {} (sd -p $args {} | psub)"
    command -sq delta && set preview "$preview | delta"

    set -l selection (printf "%s\n" $files | fzf -m --preview $preview)
    test (count $selection) != 0 && sd $args $selection
end
