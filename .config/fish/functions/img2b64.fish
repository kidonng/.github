if ! command --query file || ! command --query base64
    exit
end

function img2b64 --argument-names file
    set --local mime (file -b --mime-type $file)
    echo "data:$mime;base64,"(base64 <$file)
end
