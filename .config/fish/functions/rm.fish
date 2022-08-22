function rm
    set --local resolved (string match --invert -- "-*" $argv | path resolve)
    set --local protected $HOME

    for dir in $protected
        if contains -- $dir $resolved (path dirname -- $resolved)
            echo Trying to delete protected files under $dir, aborting. >&2
            return 1
        end
    end

    command rm -v $argv
end
