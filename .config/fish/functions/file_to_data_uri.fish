command --query base64 || exit

function file_to_date_uri --argument-names file
    # Do not use `openssl base64` which wraps output
    echo "data:"(file --brief --mime-type $file)";base64,"(base64 -i $file)
end
