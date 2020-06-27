## Profiling & Debugging

Logging instead of debugging

Lets you have severity levels and filter basaed on those.

Special characters and escape sequences help add color to terminal with the color code.


## Tools:
- lnav
- gdb
- strace

Unified system logs example => journalctl

$ logger -> help logging in unix systems

## Debugger

debugger is a tool wraps around your code and execute and set breakpoints.
Can be seen in IDEs

ipdb akage in pip can be used a debugger

where 

$ python -m ipdb bubble.py ->opens the debugges

l - list the code 
s - step 
restart - restart the program from the beginning
c - continue and break at error
p - print
q - quit the debugger
b - set breakpoint

> p arr - print the value of the array
> p j - prin the value of j
> b 6 - set breakpoint in the sixth line
> p locals() -> fn returns dictionary returns all the contents


GDB -Debugging c,C++ or any other binaries

gives low level interactions and instruction and details

```
$ gdb --args sleep 20

```

System calls 

```
$ sudo strace ls -l > /dev/null
```



## Profiling

$ htop -> task manager for linux duh..

$ du -> disk usage

$ ncdu -> interactive version

$ lsof -> list of open files

$ hyperfine -> benchmarking tool

