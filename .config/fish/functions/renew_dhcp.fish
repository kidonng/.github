test (uname) = Darwin || exit

function renew_dhcp
    set --local networkservice Wi-Fi
    networksetup -setbootp $networkservice
    networksetup -setdhcp $networkservice
end
