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

git does not use that but uses In Git, a history is a Directed Acyclic Graph (DAG) of snapshots.

Allows for snapshots and make a new snapshot with a bug fix with the feature snapshot and later combine them together into one by forking allowing for branching and merging instead of having 
a linear graph.

Allows for finding errors and report merge conflicts and erasing code form the main branch.

Snapshots also contain metadata
- author
- message
- time ...


### Psudocode for data storage in git



type blob = array of bytes [array <byte>]

type tree = mappings from file or folders in the same or different subtree map [<string,tree | blob>]

type commits = have parents and what proceed them and merge commits can have multiple merge commits along with metadata.
             = also have snapshots of it.
             
             [ type commit = struct {
             parents: array<commit>
             author: string
             message : string
             snapshot: tree
             }
             ]

### How git stored data

Defines a object(blob,tree,commit).
    objects = mapstring,object<>

All objects are content addressed and are maintained as a content address store
where the key is the hash of the object.

        def store(o):
            id = sha1(o)
            object[id] = o

Hash function = takes a big piece of data and turns it into a short string.

To load from the store is looking them up by their id and retreive it's contents.
            
            def load(id):
                return object[id]

#### Git implementation is done in bash,c & perl

sha1 hashes are hexadecimal strings 40 char longs
sha1  is a 160 bit long string



git maintains objects and a set of references.

references is a map form string to string 

        references = map <string,string>

it allows for 


the git graph is immutable while the refrences are mutable.

git is manipulation of objects and refrences

git has a staging area and takes a snapshot when using git commit


$ git cat-file  -p <hash>

give tree,author,committer data
and contains hash

$ git log --all --graph --decorators # graph representation of logs

$ git checkout # look at files at particular commit  

$ git diff hello.txt #diff

Basics

    git help <command>: get help for a git command
    git init: creates a new git repo, with data stored in the .git directory
    git status: tells you what’s going on
    git add <filename>: adds files to staging area
    git commit: creates a new commit
        Write good commit messages!
        Even more reasons to write good commit messages!
    git log: shows a flattened log of history
    git log --all --graph --decorate: visualizes history as a DAG
    git diff <filename>: show differences since the last commit
    git diff <revision> <filename>: shows differences in a file between snapshots
    git checkout <revision>: updates HEAD and current branch

Branching and merging

    git branch: shows branches
    git branch <name>: creates a branch
    git checkout -b <name>: creates a branch and switches to it
        same as git branch <name>; git checkout <name>
    git merge <revision>: merges into current branch
    git mergetool: use a fancy tool to help resolve merge conflicts
    git rebase: rebase set of patches onto a new base

Remotes

    git remote: list remotes
    git remote add <name> <url>: add a remote
    git push <remote> <local branch>:<remote branch>: send objects to remote, and update remote reference
    git branch --set-upstream-to=<remote>/<remote branch>: set up correspondence between local and remote branch
    git fetch: retrieve objects/references from a remote
    git pull: same as git fetch; git merge
    git clone: download repository from remote

Undo

    git commit --amend: edit a commit’s contents/message
    git reset HEAD <file>: unstage a file
    git checkout -- <file>: discard changes

Advanced Git

    git config: Git is highly customizable
    git clone --depth=1: shallow clone, without entire version history
    git add -p: interactive staging
    git rebase -i: interactive rebasing
    git blame: show who last edited which line
    git stash: temporarily remove modifications to working directory
    git bisect: binary search history (e.g. for regressions)
    .gitignore: specify intentionally untracked files to ignore

