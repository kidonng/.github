# Typical usage:
# echo hello >(ensure foo/bar/baz)
function ensure -a file -d "Ensure parent directories of file exist"
    mkdir -p (dirname $file)
    echo $file
end
