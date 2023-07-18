function fish_title
    set --local max 25

    if set --query argv[1]
        string shorten --max $max $argv
        return
    end

    switch $PWD
        case ~
            echo "~"
        case "*"
            set --local dir $PWD
            # https://github.com/IlanCosman/tide/blob/f24de1efaa1d9eb4ff3bad036d1987751dba99cb/functions/tide/configure/configs/classic.fish#L76
            set --local markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform Cargo.toml composer.json CVS go.mod package.json

            while test $dir != /
                for marker in $dir/$markers
                    if test -e $marker
                        path basename $dir
                        return
                    end
                end

                set dir (path dirname $dir)
            end

            path basename $PWD
    end | string shorten --max $max
end
