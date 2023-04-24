command --query cloc
and command --query git
or exit

function cloc
    if git rev-parse --is-inside-work-tree &>/dev/null
        set --prepend argv --vcs git
    end

    command cloc $argv
end
