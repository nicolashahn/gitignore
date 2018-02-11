
# necessary for gitignore
readlinkf() {
    cd $(dirname $1)
    echo $PWD/$(basename $1)
}

gitignore() {
    rootdir="`git rev-parse --show-toplevel`/"
    gitignorefile="$rootdir.gitignore"
    for arg
    do 
        abs=`readlinkf $arg`
        trimmed=${abs/$rootdir/}
        echo "$trimmed" >> $gitignorefile
    done
}
