# Typical usage:
# echo hello >(ensure foo/bar/baz)
function ensure --argument-names file --description "Ensure parent directories of file exist"
    mkdir -p (path dirname $file)
    echo $file
end
