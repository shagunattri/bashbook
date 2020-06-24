### Command line environment

- Job control
- Terminal Multiplexers
- dotfiles
- Working with Remote Machines

## JOB CONTROL

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
```
$ sleep 1000

ctrl + z suspends sleep

$ nohup sleep 200 & -> & makes the program run in the background

$ jobs -> give status of running and suspended jobs 

to run a suspended job use

$ bg %1 runs 1st suspended jobs
```

`kill` -> allows to send any sort of signal

```
$ kil -STOP %1 -> stops first process

$ kill -HUP %1 -> hangup 1st process

$ jobs -> shows only secnd ps not 1st as it is hungup/stopped

$ kill -KILL %2 -> kills 2nd job with no jobs remaining
```

bg & fg for changing processes actions to bg or fg

## TERMINAL MULTIPLEXERS

tmux

- `Sessions`
a session is an independent workspace with one or more windows

    tmux starts a new session.
    tmux new -s NAME starts it with that name.
    tmux ls lists the current sessions
    Within tmux typing <C-b> d detaches the current session
    tmux a attaches the last session. You can use -t flag to specify which

- sessions have `windows`
Equivalent to tabs in editors or browsers, they are visually separate parts of the same session

    <C-b> c Creates a new window. To close it you can just terminate the shells doing <C-d>
    <C-b> N Go to the N th window. Note they are numbered
    <C-b> p Goes to the previous window
    <C-b> n Goes to the next window
    <C-b> , Rename the current window
    <C-b> w List current windows

- windows have `Panes`
 Like vim splits, panes let you have multiple shells in the same visual display.

    <C-b> " Split the current pane horizontally
    <C-b> % Split the current pane vertically
    <C-b> <direction> Move to the pane in the specified direction. Direction here means arrow keys.
    <C-b> z Toggle zoom for the current pane
    <C-b> [ Start scrollback. You can then press <space> to start a selection and <enter> to copy that selection.
    <C-b> <space> Cycle through pane arrangements.


## DOTFILES

alias are short forms of another command
make you terminal your own with your tweaks in bashrc,vimrc,tmux.conf....

PS1 is prompt string for the shell

$ PS1 = ">\w " #changes bash prompt \w prints working dirf


Symlinking dotfiles helps manage dotfiles and helps with not having your home dir to be git repo

To organize your dotfiles? 
They should be in their own folder, under version control, and symlinked into place using a script. 
This has the benefits of:

    Easy installation: if you log in to a new machine, applying your customizations will only take a minute.
    Portability: your tools will work the same way everywhere.
    Synchronization: you can update your dotfiles anywhere and keep them all in sync.
    Change tracking: you’re probably going to be maintaining your dotfiles for your entire programming career, and version history is nice to have for long-lived projects.


## Working with Remote Machines

using ssh and its various commands

ssh-keygen
ssh-keys
Key based authentication

ssh will look into .ssh/authorized_keys to determine which clients it should let in. To copy a public key over you can use:

$ cat .ssh/id_ed25519.pub | ssh foobar@remote 'cat >> ~/.ssh/authorized_keys'

`ssh-copy also helps with copying`

$ ssh-copy-id -i .ssh/id_ed25519.pub foobar@remote


## Copying files over SSH

There are many ways to copy files over ssh:

    ssh+tee, the simplest is to use ssh command execution and STDIN input by doing cat localfile | ssh remote_server tee serverfile. Recall that tee writes the output from STDIN into a file.

    scp when copying large amounts of files/directories, the secure copy scp command is more convenient since it can easily recurse over paths. The syntax is scp path/to/local_file remote_host:path/to/remote_file
    rsync improves upon scp by detecting identical files in local and remote, and preventing copying them again. It also provides more fine grained control over symlinks, permissions and has extra features like the --partial flag that can resume from a previously interrupted copy. rsync has a similar syntax to scp.

