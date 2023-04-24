command --query base64 || exit

function img2b64 --argument-names img
    # `openssl base64` will wrap output
    echo "data:"(file --brief --mime-type $img)";base64,"(base64 -i $img)
end
