one piece of data to other representation of data is data wrangling 
piping is an eg of data wrangling

Data is required 

less amnd man are pagers to navigate and show a lot of data or information

Eg: ssh myserver 'journalctl | grep sshd | grep "Disconnected from"' | less


`sed` is a stream editor
- lets you change content of a stream 
- full blown programming language
-

$ ssh myserver 'journalctl | grep sshd | grep "Disconnected from"' > ssh.log
$ less ssh.log

sed has search stream and replacement stream to change the dat 

regex is a powerful way to match text(mostly) and have a no of characters to match

. any single char
* 0 or more of any char followed by the data
+ 1 or more matches //prev char to match atleast once
[] 1 of many different chars 

regex by default match once and with sed using g matches with all occurences
sed -E uses modern regex expression 

cat ssh.log | sed 's/.*DIsconnected from//' -> s means substitute expression enclosed in / 
                                            -> search for follwing pattern and replace it with a blank space

$ echo 'aba' | sed 's/[ab]//' -> 1 of many occurence of ab to be replace with nothing
-> ba

$ echo 'bba' | sed 's/[ab]//' -> 1 of many occurence of ab to be replace with nothing
->bba

regex by default match once and with sed using g matches with all occurences


