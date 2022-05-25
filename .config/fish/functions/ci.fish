function ci -w curl -d "curl -I"
    curl -sSI $argv | bat -l http -p
end
