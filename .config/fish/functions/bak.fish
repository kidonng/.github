function bak -d "Backup or restore .bak files"
    for arg in $argv
        set -l old_name (basename $arg)
        set -l new_name (string replace -r '\.bak$' "" -- $old_name) || set new_name $old_name.bak

        mv $old_name $new_name

        # Typical usage:
        # string trim <(bak foo) >foo
        if status -c
            echo $new_name
        end
    end
end
