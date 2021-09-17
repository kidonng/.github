test (uname) = Darwin || exit

function renew_dhcp -d "Renew macOS DHCP lease"
    set -l networkservice Wi-Fi
    networksetup -setbootp $networkservice
    networksetup -setdhcp $networkservice
end
