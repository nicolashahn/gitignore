
# necessary for gitignore
readlinkf() {
    cd $(dirname $1)
    echo $PWD/$(basename $1)
}

gitignore() {
    rootdir="`git rev-parse --show-toplevel`/"
    ignorefile="$rootdir.gitignore"
    for arg
    do 
        abs=`readlinkf $arg`
        trimmed=${abs/$rootdir/}
        if [ -f "$abs" ] || [ -d "$abs" ]; then
            grep -qF -- "$trimmed" "$ignorefile" || echo "$trimmed" >> $ignorefile
        else
            echo "path '$trimmed' does not exist, skipping"
        fi
    done
}
