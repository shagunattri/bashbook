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

$ man test -> utility to evaluate expressions# foobar
