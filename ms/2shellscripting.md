## Shell Scripting

Piping and executing is all good but you can also perform a series of commands and make use of 
control flow expressions like conditionals or loops.

Shell scripts are optimixed to perform shell-relatead tasks.



```bash
mcd () {
    mkdir -p "$1" # create dir from user arg
    cd "$1"       # cd to the dir
}
```

[Special chars in bash](https://www.tldp.org/LDP/abs/html/special-chars.html)


Exit codes and return status report errors and status of exec. 

Exit codes can be used to conditionally execute commands using && (and operator) and || (or operator), both of which are [short-circuiting](https://en.wikipedia.org/wiki/Short-circuit_evaluation) operators.

Commands can also be separated within the same line using a semicolon ; 

The true program will always have a 0 return code and the false command will always have a 1 return code.

## Command Substitution

Whenever you place $( CMD ) it will execute CMD, get the output of the command and substitute it in place.

```bash

#!/bin/bash

echo "Starting program at $(date)" # Date will be substituted

echo "Running program $0 with $# arguments with pid $$"

for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null
    # When pattern is not found, grep has exit status 1
    # We redirect STDOUT and STDERR to a null register since we do not care about them
    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    fi
done
```

## Globbing
- Wildcards ?,*
- Curly braces {}


> To find errors in your sh/bash files you can use [shellcheck](https://github.com/koalaman/shellcheck)

## Finding files

```bash
# Find all directories named src
find . -name src -type d

# Find all python files that have a folder named test in their path
find . -path '*/test/*.py' -type f

# Find all files modified in the last day
find . -mtime -1

# Find all zip files with size in range 500k to 10M
find . -size +500k -size -10M -name '*.tar.gz'

# Delete all files with .tmp extension
find . -name '*.tmp' -exec rm {} \;

# Find all PNG files and convert them to JPG
find . -name '*.png' -exec convert {} {}.jpg \;
```


> [fd](https://github.com/sharkdp/fd) is a simple, fast, and user-friendly alternative to find. 


An alternative for `find` and `fd` is `locate`

`locate` uses a database that is updated using `updatedb`.

In most systems,` updatedb` is updated daily via `cronjobs`.

## Finding Code

To find code and snippets of in files you can use `grep` a generic tool for matching patterns for the input text.

`grep` comes with many flags to be used frequently for searching

`-C` for getting Context around the matching line

```bash
grep -C 5    #will print 5 lines before and after the match.
```
`-v` for inverting the match, i.e. print all lines that do not match the pattern.

`-R` to recursively go into directories and look for files for the matching string.

There are a lot of grep alternatives like:
- [ack](https://beyondgrep.com/)
- [ag](https://github.com/ggreer/the_silver_searcher)
- [rg](https://github.com/BurntSushi/ripgrep)


Eg using `rg` as an alternative to `grep`

```bash 
# Find all python files where I used the requests library
rg -t py 'import requests'

# Find all files (including hidden files) without a shebang line
rg -u --files-without-match "^#!"

# Find all matches of foo and print the following 5 lines
rg foo -A 5

# Print statistics of matches (# of matched lines and files )
rg --stats PATTERN
```

## Finding shell commands

`history` - let's you view your shell cmd history and can use grep to search patterns

`^R` - performs backward search through out your history and match with the suitable results

## Directory Navigation

You can use tools like broot,ranger,nnn,tree and fasd,autojump to navigate directories efficiently.



