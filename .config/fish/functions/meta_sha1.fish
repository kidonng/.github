function meta_sha1 -a file -d "Calculate SHA1 for META-INF"
    set -l name "Name: $file"

    set -l sha1 (openssl sha1 -binary $file | openssl base64)
    set -l sha1_digest "SHA1-Digest: $sha1"

    set -l sha1_manifest (openssl sha1 -binary (echo -n "$name"\r\n"$sha1_digest"\r\n\r\n | psub) | openssl base64)
    set -l sha1_digest_manifest "SHA1-Digest-Manifest: $sha1_manifest"

    printf "%s\n" $name $sha1_digest $sha1_digest_manifest
end
