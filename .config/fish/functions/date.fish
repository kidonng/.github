test (uname) = Darwin || exit

function date
    # macOS `date` cannot handle ms, strip them
    string match --regex --quiet -- "^-\w*r" $argv
    and set argv[-1] (string sub --length 10 -- $argv[-1])

    command date $argv
end
