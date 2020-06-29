## Shell

>Bourne Again SHell, or “bash”

Tools:
- grep
- fzf
- broot
- mlocate
- rg
- tree


```console
foo=bar
echo $foo # bar
```
`~` -> is short for home
`$` -> means you are not root user

```
date -> displays date,time....
```

$ echo "value is  $foo" -> value is bar

spaces are reserved and are for separating args

## defining strings 
with "" or '' for literal strings
but single quotes donot replace the value 

```bash
$ echo 'value is $foo' -> value is $foo
$ echo Value\ is\ $foo -> Value is bar
$ echo Value\ is\ '$foo' -> Value is $foo
$ echo Value\ is\ "$foo" -> Value is bar
```

assigning variables is with `$`

`$0` - name of the script
`$1` -> $9 are for the args in the cmd
`$@` - all the args
`$?` - error code from prev command 
`$#` - gives no of args give to the command
`$$` - pid of the current script
`$_` will give you the last arg from the previous command
`!!` - replace the previous command


Eg:
```
$ mkdir /mnt/test -> gives permission denied

you can

$ sudo !! -> run the previous command with sudo
```


`0`-exit code means things went fine -> true - 0
`1`-error -> false - 1


>The shell is a programming environment
If the shell is asked to execute a command that doesn’t match one of its programming keywords, 
it consults an environment variable called `$PATH` 
that lists which directories the shell should search for programs when it is given a command:

```
echo $PATH

which echo -> where is echo in the fs
           -> and look at which file is executed
 
 can also be executed as

/bin/echo $PATH
```

## Navigating the Shell

`/`  -> root of the fs
`.`  -> current dir
`..` -> prev dir


mv -i -> move -interactive
cp    -> copy
mkdir -> make dir
man   -> manual page


## Streams
- Input Stream
- Output Stream

## Redirection
- < >
- >> #append
- | #pipe

```
missing:~$ ls -l / | tail -n1
drwxr-xr-x 1 root  root  4096 Jun 20  2019 var
missing:~$ curl --head --silent google.com | grep --ignore-case content-length | cut --delimiter=' ' -f2
219
```

```console
missing:~$ echo hello > hello.txt
missing:~$ cat hello.txt
hello
missing:~$ cat < hello.txt
hello
missing:~$ cat < hello.txt > hello2.txt
missing:~$ cat hello2.txt
hello
```

## Editing system files 

/sys 

>sysfs exposes a number of kernel parameters as files, so that you can easily reconfigure the kernel on the fly without specialized tools.

### To chage the the brightness of your laptop’s screen is exposed through a file called brightness under

```
$sudo find -L /sys/class/backlight -maxdepth 2 -name '*brightness*'
/sys/class/backlight/thinkpad_screen/brightness
```

`$ echo 1 | sudo tee /sys/class/leds/input6::scrolllock/brightness`


## Operators in Bash

$ false || echo "oops fail" -> Oops fail

$ true || echo "Will not be printed" -> nothing printed 

$ true && echo "things went well" -> things went well

$ false && echo "Thiss will not print" -> nothing printed

$ fasle ; echo "This will always print" -> This will always print

; concatenates commands in the same line and will always execute

## output of a command into a variable

foo=$(pwd)

echo $foo -> gives pwd o/p


## Command substitution

`$ echo "We are in $(pwd)"`

## Process substitution

```
                            # create a temp file and 
$ diff <(ls foo) <(ls bar) # shows file difference between foo and bar dirs

$ cat <(ls) <(ls ..) #op in a temp file and file handle and then cat the output and display in the shell
```

grep -> search for substring

/dev/null/ - special location where all written changes are later discarded.

`$ man test -> utility to evaluate expressions`


## file shell expansions with globbing
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

```console
$ man mv # manual page for mv


$ mlocate #for searching for files and has a cronjob for updating db index with file data
        #updatedb to update index

$ grep -R foobar # recursive search for foobar

$ rg "import requests" -t py -C 5 ~scratch --stats  # ripgrep search for looking at fileswith the "" stmnt in py files   and a context of 5 lines around it
                                                    # --stats give stats about the search

$ rg -u --files-without-match "^#\!" -t sh     #lookfor sh file  with regex 
                                                -u # ignore hidden files

$ history # prints terminal history

$ history 1 # history from the beginning

$ history 1 | grep convert # cmds with convert

$ Ctrl + r # recursive search 

$ ctrl + r + fzf # good search :)

$ fzf # fuzzy finder

$ ls -R # recursive list dir structure

$ tree # friendly file listing in tree structure

$ broot # listing files with additional files
```


