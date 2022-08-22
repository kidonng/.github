function get_proxy --description "Get system proxy"
    if test (uname) = Darwin
        set --local output (scutil --proxy)

        if string match --entire --quiet "HTTPEnable : 1" $output
            set --function address (string match --regex "HTTPProxy : ([\d.]+)" $output)[2]
            set --function port (string match --regex "HTTPPort : (\d+)" $output)[2]
        end
    end

    echo http://$address:$port
end
