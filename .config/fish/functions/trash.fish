command --query trash || exit

function trash
    command trash -F -v $argv | string replace ~ "~"
end
