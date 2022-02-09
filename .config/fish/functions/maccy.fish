# Based on https://github.com/junegunn/tmux-fzf-maccy/blob/4b86e0b42e22e6d4b51f71452572072aeff6d14b/fzf-maccy.sh
set -l db ~/"Library/Containers/org.p0deje.Maccy/Data/Library/Application Support/Maccy/Storage.sqlite"

if ! command -sq sqlite3 || ! command -sq fzf || ! test -f $db
    exit
end

function maccy -V db -d "Maccy + fzf"
    set -l selection (
        sqlite3 -newline \1 $db "
            SELECT DISTINCT ZVALUE
            FROM ZHISTORYITEMCONTENT
            WHERE ZTYPE IN ('public.text', 'public.utf8-plain-text')
            ORDER BY Z_PK DESC
        " |
        tr \1 "\0" |
        fzf --read0 -m --tiebreak index --preview "echo {}" --preview-window bottom:3
    )

    set -q selection[1] || return

    if isatty stdout
        commandline -i -- $selection
    else
        printf "%s\n" $selection
    end
end
