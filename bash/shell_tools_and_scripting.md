foo=bar
echo $foo # bar

spaces are reserveed and are for separating args

# definng string 
with "" or '' for literal strings

$ echo "value is  $foo" -> value is bar

but single quotes donot replace the value 

$ echo 'value is $foo' -> value is $foo

assigning variables is with $

$0 - name of the script
$1 -> $9 are for the args in the cmd
$@ - all the args
$? - error code from prev command 
$# - gives no of args give to the command
$$ - pid of the current script

0-exit code means things went fine -> true - 0
1-error -> false - 1

$_ will give you the last arg from the previous command

!! - replace the previous command

eg:
$ mkdir /mnt/test -> gives permission denied

you can

$ sudo !! -> run the previous command with sudo

<  # stdin 

$ false || echo "oops fail" -> Oops fail

$ true || echo "Will not be printed" -> nothing printed 

$ true && echo "things went well" -> things went well

$ false && echo "Thiss will not print" -> nothing printed

$ fasle ; echo "This will always print" -> This will always print

; concatenates commands in the same line and will always execute

# output of a command into a variable

foo=$(pwd)

echo $foo -> gives pwd o/p


# Command substitution

$ echo "We are in $(pwd)"

# Process substitution
                            # create a temp file and 
$ diff <(ls foo) <(ls bar) # shows file difference between foo and bar dirs

$ cat <(ls) <(ls ..) #op in a temp file and file handle and then cat the output and display in the shell

grep -> search for substring

/dev/null/ - special location where all written changes are later discarded.

$ man test -> utility to evaluate expressions

# file shell expansions with globbing
#### available with most shells
#### wildcard matching using ? and *

For instance, given files foo, foo1, foo2, foo10 and bar, the command rm foo? will delete foo1 and foo2 whereas rm foo* will delete all but bar.

$ ls *.sh #more like some regex anything with a sh

$ ls project? #expand ot a single one

Curly braces {} - Whenever you have a common substring in a series of commands, you can use curly braces for bash to expand this automatically. This comes in very handy when moving or converting files

```console
convert image.{png,jpg}
# Will expand to
convert image.png image.jpg

cp /path/to/project/{foo,bar,baz}.sh /newpath
# Will expand to
cp /path/to/project/foo.sh /path/to/project/bar.sh /path/to/project/baz.sh /newpath

# Globbing techniques can also be combined
mv *{.py,.sh} folder
# Will move all *.py and *.sh files


mkdir foo bar
# This creates files foo/a, foo/b, ... foo/h, bar/a, bar/b, ... bar/h
touch {foo,bar}/{a..h}
touch foo/x bar/y
# Show differences between files in foo and bar
diff <(ls foo) <(ls bar)
# Outputs
# < x
# ---
# > y
```

## shell tools

$ man mv # manual page for mv


$ mlocate #for searching for files and has a cronjob for updating db index with file data
        #updatedb to update index

$ grep -R foobar # recursive search for foobar

$ rg "import requests" -t py -C 5 ~scratch --stats  # ripgrep search for looking at fileswith the "" stmnt in py files   and a context of 5 lines around it
                                                    # --stats give stats about the search

$ rg -u --files-without-match "^#\!" -t sh lookfor sh file  with regex 

# -u # ignore hidden files

$ history # prints terminal history

$ history 1 # history from the beginning

$ history 1 | grep convert # cmds with convert

$ Ctrl + r # recursive search 

$ ctrl + r + fzf # good search :)

$ fzf # fuzzy finder

$ ls -R # recursive list dir structure

$ tree # friendly file listing in tree structure

$ broot # listing files with additional files
