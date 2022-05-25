function get_proxy -d "Get system proxy"
    if test (uname) = Darwin
        set -l output (scutil --proxy)

        if string match -eq "HTTPEnable : 1" $output
            set -f address (string match -r "HTTPProxy : ([\d.]+)" $output)[2]
            set -f port (string match -r "HTTPPort : (\d+)" $output)[2]
        end
    end

    echo http://$address:$port
end
