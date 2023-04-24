function find_up --argument-names target
    if test -e $target
        echo $target
    else
        test (path resolve $target/..) = / && return 1
        find_up ../$target
    end
end
