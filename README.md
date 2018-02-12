# gitignore
Command to add paths to `.gitignore` easily from anywhere in the repo.

- `.gitignore` will be created if it does not exist.
- Invalid paths will be ignored (by the command, not `git`).

## install
```
./install.sh
```
Adds the `alias` `gitignore` to your `.bash_profile`.

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
