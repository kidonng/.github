# Based on https://github.com/junegunn/tmux-fzf-maccy/blob/4b86e0b42e22e6d4b51f71452572072aeff6d14b/fzf-maccy.sh
set --local db ~/"Library/Containers/org.p0deje.Maccy/Data/Library/Application Support/Maccy/Storage.sqlite"

command --query sqlite3
and command --query fzf
and test -f $db
or exit

function maccy --inherit-variable db --description "Maccy + fzf"
    set --local selection (
        sqlite3 -newline \1 $db "
            SELECT DISTINCT ZVALUE
            FROM ZHISTORYITEMCONTENT
            WHERE ZTYPE IN ('public.text', 'public.utf8-plain-text')
            ORDER BY Z_PK DESC
        " |
        tr \1 "\0" |
        fzf \
            --read0 \
            --multi \
            --tiebreak index \
            --preview "echo {}" \
            --preview-window bottom:3
    )

    set --query selection[1] && printf "%s\n" $selection
end
