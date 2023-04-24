test (uname) = Darwin || exit

function spot --description "Manage Spotlight exclusions"
    argparse a/add r/remove -- $argv || return

    set --local list (_spot_buddy Print :Exclusions | string trim)
    set --erase list[1] list[-1]

    # It seems modifying the plist doesn't work as of macOS Monterey
    if set --query _flag_add
        for path in $argv
            set --local resolved (path resolve $path)

            if contains $resolved $list
                echo spot: $resolved is already excluded >&2
                continue
            end

            _spot_buddy Add :Exclusions: string $resolved
        end
    else if set --query _flag_remove
        for path in $argv
            set --local resolved (path resolve $path)

            if ! set --local index (contains --index $resolved $list)
                echo spot: $resolved is not excluded >&2
                continue
            end

            _spot_buddy Delete :Exclusions:(math $index - 1) string
        end
    else
        if isatty stdout
            string replace ~ "~" $list
        else
            printf %s\n $list
        end
    end
end
