function cloc
    if git rev-parse --is-inside-work-tree &>/dev/null
        set -p argv --vcs git
    end

    command cloc $argv
end
