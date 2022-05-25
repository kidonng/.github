if ! command -sq sed || ! command -sq rg || ! command -sq fzf
    exit
end

function sef -w rg -d "sed + fzf"
    set -l non_opts (string match -v -- "-*" $argv)
    set -l first_non_opt (contains -i -- $non_opts[1] $argv)
    test "$first_non_opt" = 1 && set -l opts || set -l opts $argv[..(math $first_non_opt - 1)]

    if set -l sep (contains -i -- -- $argv)
        test $sep = 1 && set opts || set opts $argv[..(math $sep - 1)]
        set non_opts $argv[(math $sep + 1)..]
    end

    set -l find $non_opts[1]
    set -l replace $non_opts[2]
    set -l files $non_opts[3..]

    set -l args s/$find/$replace/g
    set -l selection (
        rg -l $opts $find $files |
        fzf -m --preview "diff -u {} (sed -E $args {} | psub) | delta --features no-file-decoration"
    ) && sed -Ei '' $args $selection
end
