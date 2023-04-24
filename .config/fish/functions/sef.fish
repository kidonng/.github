command --query rg
and command --query fzf
or exit

# Inspired by https://github.com/ms-jpq/sad
function sef --wraps rg --description "sed + ripgrep + fzf"
    set --local non_opts (string match --invert -- "-*" $argv)
    set --local first_non_opt (contains --index -- $non_opts[1] $argv)
    test "$first_non_opt" = 1 && set --local opts || set --local opts $argv[..(math $first_non_opt - 1)]

    if set --local sep (contains --index -- -- $argv)
        test $sep = 1 && set opts || set opts $argv[..(math $sep - 1)]
        set non_opts $argv[(math $sep + 1)..]
    end

    set --local find $non_opts[1]
    set --local rg_find (string replace --all -- "\/" / $find)
    set --local replace $non_opts[2]
    set --local files $non_opts[3..]

    command --query delta && set --local delta "| delta --features no-file-decoration"

    set --local args s/$find/$replace/g
    set --local selection (
        rg --files-with-matches $opts $rg_find $files |
        fzf \
            --multi \
            --exit-0 \
            --preview "diff -u {} (sed -E '$args' {} | psub) $delta"
    ) && sed -Ei '' $args $selection
end
