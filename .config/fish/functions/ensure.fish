# Usage: echo hello >(ensure foo/bar/baz)
function ensure --argument-names file --description "Ensure parent directories of file exist"
    # Silence potential -v message
    mkdir -p (path dirname $file) >/dev/null
    echo $file
end
