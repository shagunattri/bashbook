### ping google.com -c 1
```
PING google.com(del11s03-in-x0e.1e100.net (2404:6800:4002:80e::200e)) 56 data bytes
64 bytes from del11s03-in-x0e.1e100.net (2404:6800:4002:80e::200e): icmp_seq=1 ttl=56 time=88.7 ms

--- google.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 88.675/88.675/88.675/0.000 ms
```

### cat ip.md | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" 
```
del11s03-in-x0e.1e100.net
```

### for ip $(cat iplist.txt); do nmap -sS -p 80 -T4 $ip & done
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

### ps -auxw | grep http 

```
id10t       22  0.0  0.0   8572   208 tty1     R    23:50   0:00 grep http
```

### ps -axu | grep htt

```
id10t       25  0.0  0.0  14200  1260 tty1     S    23:53   0:00 grep htt 
```

### !ps:p
```
ps -axu | grep htt
```

## password generator

### Bash
```console

$ chmod +x pwGenerator.sh

$ ./pwGenerator.sh
```



































