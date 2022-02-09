function rename -a old_pattern new_pattern
    argparse q/quiet -- $argv || return

    for file in $argv[3..]
        if ! string match -rq -- $old_pattern $file
            set -q _flag_quiet || echo rename: (set_color -o)$file(set_color normal) does not match the old pattern >&2
            continue
        end

        set -l new_file (string replace -r -- $old_pattern $new_pattern $file)
        mv $file $new_file
    end
end
