test (uname) = Darwin || exit

# https://mattprice.me/2020/programmatically-modify-spotlight-ignore/
function _spot_buddy
    sudo /usr/libexec/PlistBuddy -c "$argv" /System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist
end

function spot -d "Manage Spotlight exclusions"
    argparse a/add r/remove -- $argv || return

    set -l list (_spot_buddy Print :Exclusions | string trim)
    set -e list[1] list[-1]

    # It seems modifying the plist doesn't work as of macOS Monterey
    if set -q _flag_add
        for path in $argv
            set -l real (realpath $path)

            if contains $real $list
                echo spot: $real is already excluded >&2
                continue
            end

            _spot_buddy Add :Exclusions: string $real
        end
    else if set -q _flag_remove
        for path in $argv
            set -l real (realpath $path)

            if ! set -l index (contains -i $real $list)
                echo spot: $real is not excluded >&2
                continue
            end

            _spot_buddy Delete :Exclusions:(math $index - 1) string
        end
    else
        string replace $HOME "~" $list
    end
end
