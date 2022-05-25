function fish_title
    if set -q argv[1]
        echo $argv
        return
    end

    switch $PWD
        case $HOME
            echo "~"
        case /
            echo /
        case "*"
            set -l sections (string split / $PWD)
            set -l current $sections[-1]
            # https://github.com/IlanCosman/tide/blob/f24de1efaa1d9eb4ff3bad036d1987751dba99cb/functions/tide/configure/configs/classic.fish#L76
            set -l tide_pwd_markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform Cargo.toml composer.json CVS go.mod package.json

            while test (count $sections) != 1
                for marker in (string join / $sections)/$tide_pwd_markers
                    if test -e $marker
                        echo $sections[-1]
                        return
                    end
                end

                set -e sections[-1]
            end

            echo $current
    end
end
