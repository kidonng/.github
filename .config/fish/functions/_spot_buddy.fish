set -l buddy /usr/libexec/PlistBuddy
test -x $buddy || exit

# https://mattprice.me/2020/programmatically-modify-spotlight-ignore/
function _spot_buddy -V buddy
    sudo $buddy -c "$argv" /System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist
end
