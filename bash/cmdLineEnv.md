### Command line environment

- Job control
- Terminal Multiplexers
- dotfiles
- Working with Remote Machines


$ sleep 20 -> sleep for 20 sec

$ ^c -> to cancel the sleep command

UNIX sigint singnal integer triggered to stop itself

$ man signal -> signal mgmt.

SIGINT -> signal interrupt program ^c

have no identifiers 
`SIGNIT` that a terminal will send to a program when it wants to interrupt it.

`SIGQUIT` -. quit exec of program uses SIGQUIT signal

`SIGTERM` - eq to other two but the output is not sent to the terminal

`SIGHUP` -  signal when we cause a hanguop in the program 

`SIGSTOP` - to pause the execution of a program

`SIGCONT` - to continue the exec of the program

to stop sigint.py

we use ctrl+c but is captured and execution still runs

On using ctrl + \ ot ctrl + z we send a SIGQUIT to quit its exec

###  SIGNALS that cannot be captured by the system

`SIGKILL` -terminate no matter what

$ sleep 1000

ctrl + z suspends sleep

$ nohup sleep 200 & -> & makes the program run in the background

$ jobs -> give status of running and suspended jobs 

to run a suspended job use

$ bg %1 runs 1st suspended jobs

`kill` -> allows to send any sort of signal

$ kil -STOP %1 -> stops first process

$ kill -HUP %1 -> hangup 1st process

$ jobs -> shows only secnd ps not 1st as it is hungup/stopped

 




