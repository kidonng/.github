function bak --description "Backup or restore .bak files"
    for old in $argv
        set --local normalized (path normalize $old)

        if string match --quiet "*.bak" -- $normalized
            set --function new (path change-extension -- "" $normalized)
        else
            set --function new $normalized.bak
        end

        set --local cmd mv $old $new

        # Usage: string trim <(bak foo) >foo
        if status is-command-substitution
            # Silence potential -v message
            $cmd >/dev/null
            echo $new
        else
            $cmd
        end
    end
end
