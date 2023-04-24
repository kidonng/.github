command --query base64 || exit

function file_to_date_uri --argument-names img
    # Do not use `openssl base64` which wraps output
    echo "data:"(file --brief --mime-type $img)";base64,"(base64 -i $img)
end
