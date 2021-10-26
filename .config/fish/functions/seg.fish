if ! command -s sed || ! command -s rg
    exit
end

function seg -w rg -d "sed + ripgrep"
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

    sed -i '' s/$find/$replace/g (rg --files-with-matches $opts $find $files)
end
