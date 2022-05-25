test (uname) = Darwin || exit

function date
    # macOS `date` cannot handle ms, strip them
    string match -q -- -r $argv && set argv[-1] (string sub -l 10 -- $argv[-1])

    command date $argv
end
