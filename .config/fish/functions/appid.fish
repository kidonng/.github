test (uname) = Darwin || exit

function appid --argument-names name --description "Get bundle ID of an application"
    osascript -e "id of app \"$name\""
end
