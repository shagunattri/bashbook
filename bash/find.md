The syntax of the command can be broken down as such:

***find where what***


Firstly you tell the system to find something; secondly you tell it where to look; and finally, you tell it what to look for.

You don’t need to specify when you’re looking in your working directory. Also, you can use wildcards as well, in specifying both a directory and a name.


On your terminal, execute the command:

`touch file-1 file-2`

This command will create two files, named file-1 and file-2 respectively, in your current working directory.


Now, execute:

`find file*`

As you can see, the command outputs both of your files.


This time, execute:

`find *1`

Only file-1 is in the output.


These commands are useful when you want to specify only part of the name of what you’re looking for.

Most of the time, you won’t be looking for something in your working directory. The first argument of your `find` command should be the directory you want to search. The command will search in that directory and in all its subdirectories. So, if you want to search the whole filesystem, your command should begin with `find /`.


Two very useful flags are the `-type` and `-name` flags. With `-type`, you can use `d`to only find directories, and `f` to only find files. The `-name` flag is used to specify a name or pattern to look for. You can type the whole name, or use wildcards to specify only part(s) of the name. If you use wildcards, you need to enclose your pattern in quotes, otherwise the command won't work as intended. It is useful to know that you can also use the `-iname` flag; same as `-name`, but case insensitive.
