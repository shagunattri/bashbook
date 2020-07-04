# Vim


>vim is a modal editor

starts up in normal mode and key combinations help change the modes

the interface is a programming language in itself -> fundamental idea of vim

>""edit as you think""


### Operation Modes

normal - esc

insert - i

replace - r

visual - v

Visual Line mode - V

Visual block mode - ^V

command line mode - :

>Keystrokes have different meanings in different operating modes. 


`:quit :q` -> quit current window you are in 

`:qa` -> quit all

`:w` -> save

`:help` <key> -> help 

`:help :w` -> help for w

`w` and `:w` are differnt as :w is cmd mode not w

`^D` -> to move around in normal mode

Vim maintains buffers i.e a set of open files.
buffers of tabs/spaces is different in vim
windows are merely views. A given buffer may be open in multiple windows, even
within the same tab. This can be quite handy, for example, to view two different parts
of a file at the same time.


`:sp` make split and open same file making a new tab

`hjkl` -> movement

```
 k
h  l
 j
```
**Words**

`w` -> move cursor frwd by one word

`e` -> move cursor to end of word

`b` -> move cursor back by one word

**Lines**

`0` Beginning of the line

`$` ->moves to end of the line

`^` -> first non empty character on the line

**Movement in buffer**

`^u` ->up the file

`^D` ->down the file

**File**

`G` - move to bottom of the buffer

`gg` - move to buffer all the way up

**Screen**

`L` - move to the **lowest** line in the screen 

`M` - move cursor to the **middle** of the screen

`H` - move to the **top/highest** line in the screen

**Line numbers**

`:{number}<Enter>`

`{number}G`

### Find and to

find with f

`fo` -> finds first words with o in the line

`Fo` -> finds prev words with o in the line

**Find and to with t**

`to` -> jump to o one character before o

`To` -> jump to O one character after o

**Editing commands**

`i` -for insert mode

`o` - open a new line below the cursor and enter insert mode

`O` - open a new line above the cursor and enter insert mode

**Deleting/Yanking**

`dw` - delete the word

`dl` - delete the line

`de` - delete the end of the word

`c` - change and replace

`ce` - change the end of the word

`x` - delete the charactes that is on cursor

`r` - replace character with other character

`y` - yank (copy)

`yw` - copy word

`~` - change the case of the word

`yy` - yank a line (copy)

`p` - paste a line

`u` - undo

`^R` - redo

`dd` - delete line

`^v` - highlight the line 

`j` - keep highlighing lines

`y` - yank and register

`d` - delete

`v` - visual mode and highlight word


## Modifiers
`a` - around

`i` - inside

`c2w`- change two words

`ci[` - change inside squarebrackets

`%` -jump b/w parenthesis

`di(` - delete content inside paranthesis

`da(` - delete around paranthesis including ()

`a` - append

`n` -next match in search

`ci'` - change contents inside quotes

`.` -repeat previous task/command
