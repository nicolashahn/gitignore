# gitignore
Command to add paths to `.gitignore` easily from anywhere in the repo.

- `.gitignore` will be created if it does not exist.
- Invalid paths will be ignored (by the command, not `git`).

## install
Create an alias in your `.bash_profile` and then reload it:
```
cd gitignore
echo "alias gitignore='$PWD/gitignore.sh'" >> ~/.bash_profile
source ~/.bash_profile
```

## usage
```
gitignore <path(s) to be added to .gitignore>
```

## example
```
foo/
    .gitignore
    already_ignored
    bar/
        ignore_me
        me_too
```

```
$ cat .gitignore
already_ignored
$ cd bar
$ gitignore ignore_me me_too
$ cat ../.gitignore
already_ignored
bar/ignore_me
bar/me_too
```
