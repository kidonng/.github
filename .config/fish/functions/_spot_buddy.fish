test (uname) = Darwin || exit

# https://mattprice.me/2020/programmatically-modify-spotlight-ignore/
function _spot_buddy
    sudo /usr/libexec/PlistBuddy -c "$argv" \
        /System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist
end
