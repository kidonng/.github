command -sq qlmanage || exit

function qlmanage
    command qlmanage $argv 2>/dev/null
end
