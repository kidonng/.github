function bak --description "Backup or restore .bak files"
    for old in $argv
        if string match --quiet "*.bak" -- (path normalize $old)
            set --function new (path change-extension -- "" $old)
        else
            set --function new (path normalize $old).bak
        end

        set --local cmd mv $old $new

        # Typical usage:
        # string trim <(bak foo) >foo
        if status is-command-substituion
            # Silence potential -v message
            $cmd >/dev/null
            echo $new
        else
            $cmd
        end
    end
end
