# ping google.com -c 1

PING google.com(del11s03-in-x0e.1e100.net (2404:6800:4002:80e::200e)) 56 data bytes
64 bytes from del11s03-in-x0e.1e100.net (2404:6800:4002:80e::200e): icmp_seq=1 ttl=56 time=88.7 ms

--- google.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 88.675/88.675/88.675/0.000 ms


# cat ip.md | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" 


del11s03-in-x0e.1e100.net


# for ip $(cat iplist.txt); do nmap -sS -p 80 -T4 $ip & done