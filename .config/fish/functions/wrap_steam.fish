function wrap_steam
    set --local scale (math (xrdb -get Xft.dpi) / 96)

    sed s!/usr/bin/steam-runtime!'steam -forcedesktopscaling '$scale! \
        /usr/share/applications/steam.desktop >~/.local/share/applications/steam.desktop
end
