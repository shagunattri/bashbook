#!/bin/bash


▶ useradd shagun # adduser

▶ su - shagun # switch to user

▶ echo $? #returns status of operation

▶ cat /etc/lsb-release #info os

▶ ldd /usr/bin/ls # list shared objects and used in dynamically linked runtime binaries

▶ man <name>  h # for less version of man

ls -l # file as a list

everything is a file in linux look at wikipedia for more

ls and ls . are same

uname 

uname -a

free # show memory usage

free -h # human readable format

df fs #disk space

df -h #human readable  format

ps #currently running process

id #current user id

hexdump # show hex values for each character

man ascii

ctrl + R # recursive search

shutdown now 

env # run program in a modified environment configured path env variable with its purpose

 ping google.com -c 1
```
PING google.com(xxxx (xxxx)) 56 data bytes
64 bytes from xxxx (xxxx): icmp_seq=1 ttl=56 time=88.7 ms

--- google.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 88.675/88.675/88.675/0.000 ms
```

 cat ip.md | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
```
xxxx
```

 for ip $(cat iplist.txt); do nmap -sS -p 80 -T4 $ip & done
```
[1] 1251
[2] 1252
[3] 1253
[4] 1254
[5] 1255
[6] 1256
[7] 1257
[8] 1258
```

 ps

 ps -auxw | grep http 

```
id10t       22  0.0  0.0   8572   208 tty1     R    23:50   0:00 grep http
```

 ps -axu | grep htt

```
id10t       25  0.0  0.0  14200  1260 tty1     S    23:53   0:00 grep htt 
```

 !ps:p
```
ps -axu | grep htt
```

 password generator
```console
$ ./pwGenerator.sh
```






