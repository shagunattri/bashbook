## vcs
is a tool to keep tracks of files & folder and code.
To collaborate

saves in a series of snapshots and encapsulates them together

they store metadata including author,messasge and timestamps

why ?
to look at older versions
bug fixes while working 
send patches and resloving conflicts
find module data and figure out all changes and updates

Unit test not passing look at changes and vcs help  identify errors and search history to look at the change that broke your project

git is now more or less the default

git has bleak interface and needs to be understood properly while the design underlying is great
when looking at the data models.


-root dir
    folders  - tree
        files   - blob

history is a linear sequence of snapshots.

git does not use that but uses In Git, a history is a directed acyclic graph (DAG) of snapshots.
