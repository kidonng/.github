function trash
    command trash -F -v $argv | string replace $HOME "~"
end
