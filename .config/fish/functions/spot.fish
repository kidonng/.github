functions --query _spot_buddy || exit

function spot --description "Manage Spotlight exclusions"
    argparse a/add r/remove -- $argv || return

    set --local list (_spot_buddy Print :Exclusions | string trim)
    set --erase list[1] list[-1]

    # It seems modifying the plist doesn't work as of macOS Monterey
    if set --query _flag_add
        for path in $argv
            set --local real (realpath $path)

            if contains $real $list
                echo spot: $real is already excluded >&2
                continue
            end

            _spot_buddy Add :Exclusions: string $real
        end
    else if set --query _flag_remove
        for path in $argv
            set --local real (realpath $path)

            if ! set --local index (contains --index $real $list)
                echo spot: $real is not excluded >&2
                continue
            end

            _spot_buddy Delete :Exclusions:(math $index - 1) string
        end
    else
        if isatty stdout
            string replace $HOME "~" $list
        else
            printf "%s\n" $list
        end
    end
end
