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
() -> means capture groups 

regex by default match once and with sed using g matches with all occurences
sed -E uses modern regex expression 

cat ssh.log | sed 's/.*Disconnected from//' -> s means substitute expression enclosed in / 
                                            -> search for follwing pattern and replace it with a blank space

```console
$ echo 'aba' | sed 's/[ab]//' -> 1 of many occurence of ab to be replace with nothing
-> ba

$ echo 'bba' | sed 's/[ab]//' -> 1 of many occurence of ab to be replace with nothing
->bba

regex by default match once and with sed using g matches with all occurences

$ echo 'abcaba' | sed -E 's/(ab)*//g' -> -E uses modern regex
->ca

$ echo 'abcabba' | sed -E 's/(ab|bc)*//g' -> replace ab or bc in abcabba
->c
```

sort -> to sort values 
        -u flags sorts uniq values

uniq -c find unique values and its count and print it occurence

sort -nk1,1 -> 
 -n numeric sort
 -k column sort
 1,1 start form 1st colum and stop at first column

tail -n10 -> 10 last lines 
    sort -> sorts in asc order

tail gives last 10 lines at the tail

awk is alsoa full blown programming language

awk -> column based data parser
parses data in whitespace separated columns and 

$ awk '{print $2}' -> print 2nd column

paste -sd, -> pastes together into a single line with delimiter ,

`awk` is really powerful in data wrangling
    great for operation over columns

awk '$! == 1 && ~ /^c.*e$' {print $0}' -> search string where 1st column is 1 and the string starts with c and ends with e and print it's value using awk

awk ' BEGIN {rows = 0} $! == 1 && ~ /^c.*e$' {rows += 1} END {print rows}' -> set rows to 0 on the zeroth line set and match pattern to later print rows 
#### basically wc -l but in awk using BEGIN and END
