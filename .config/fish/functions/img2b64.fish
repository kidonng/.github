command --query file
and command --query base64
or exit

function img2b64
    # Do not use `openssl base64` which wraps output
    echo "data:"(file --brief --mime-type $argv)";base64,"(base64 $file)
end
