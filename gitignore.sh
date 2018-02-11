
# necessary for gitignore
readlinkf() {
    cd $(dirname $1)
    echo $PWD/$(basename $1)
}

gitignore() {
    if [ $# -eq 0 ]; then 
        echo "usage: gitignore <path(s) to be added to .gitignore>"
    fi
    rootdir="`git rev-parse --show-toplevel`/"
    ignorefile="$rootdir.gitignore"
    for arg
    do 
        abs=`readlinkf $arg`
        rel=${abs/$rootdir/}
        if [ -f "$abs" ] || [ -d "$abs" ]; then
            grep -q -- "^$rel$" "$ignorefile" || echo "$rel" >> $ignorefile
        else
            echo "path '$rel' does not exist, skipping"
        fi
    done
}
