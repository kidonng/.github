function meta_sha1 --argument-names file --description "Calculate SHA1 for META-INF"
    set --local name "Name: $file"

    set --local sha1 (
        openssl sha1 -binary $file |
        openssl base64
    )
    set --local sha1_digest "SHA1-Digest: $sha1"

    set --local sha1_manifest (
        printf "$name"\r\n"$sha1_digest"\r\n\r\n |
        openssl sha1 -binary |
        openssl base64
    )
    set --local sha1_digest_manifest "SHA1-Digest-Manifest: $sha1_manifest"

    printf "%s\n" $name $sha1_digest $sha1_digest_manifest
end
