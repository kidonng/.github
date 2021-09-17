function get_proxy -d "Get system proxy"
    set -l address
    set -l port

    if test (uname) = Darwin
        set -l output (scutil --proxy)

        if string match -eq "HTTPEnable : 1" $output
            set address (string match -r "HTTPProxy : ([\d.]+)" $output)[2]
            set port (string match -r "HTTPPort : (\d+)" $output)[2]
        end
    end

    echo http://$address:$port
end
