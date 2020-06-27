### vim is a modal editor with various modes

starts up in normal mode and key combinations help change the modes

the interface is a programming language in itself -> fundamental idea of vim

""edit as you think""


### modes
normal - esc
insert - i
replace - r
selection -
visual - v
visual line  - 
visual block - 
command line mode - :

i - to enter inert mode
esc - back to normal mode
^v - Ctrl + v
<C-V> - is also Ctrl V notation

:quit :q -> quit current window you are in 
:qa -> quit all
:w -> save
:help <key> -> help 

:help :w -> help for w
w and :w are differnt as :w is cmd mode not w

^D -> to move around in normal mode

buffers of tabs/spaces is different in vim

tabs and tabs can have windows

:sp make split and open same file making a new tab

hjkl -> movement
 k
h  l
 j


w -> move cursor frwd by one word
e -> move cursor to end of word
b -> move cursor back by one word

0 beginning of the line
$ ->moves to end of the line
^ -> first non empty character on the line

## movement in buffer

^u ->up the file
^D ->down the file

G - move to bottom of the buffer
gg - move to buffer all the way up

l - move to the **lowest** line in the screen 
m - move cursor to the **middle** of the screen
h - move to the **top/highest** line in the screen

## find and to
### find with f

$ fo -> finds first words with o in the line
$ Fo -> finds prev words with o in the line

### find and to with t
to -> jump to o one character before o
To -> jump to O one character after o

#editing commands

i -for insert mode
o - open a new line below the cursor and enter insert mode
O - open a new line above the cursor and enter insert mode


yy - yank a line (copy)
p - paste a line
u - undo
dd - delete line

```console
^v - highlight the line 
j - keep highlighing lines
y - yank and register
d - delete
``
v - visual mode and highlight word
