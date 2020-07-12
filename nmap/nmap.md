### Nmap

```bash
nmap -sP 157.230.43.191 # p-ping all hosts to the network

nmap -sT -p 80,443 157.230.43.191 # T-tcp connect/full open scan intrusive to networks

nmap -sS -p 80,443 157.230.43.191 # S-SYN/stealt/half open scan

nmap -sT 157.230.43.191 # scan 1000 ports

nmap -O 157.230.43.191 # ping.open ports and os detection

nmap -A 157.230.43.191 #A-os,version of protocol, script scanning,trace route

nmap -sS -D 1.1.1.1 157.230.43.191 #D-duplicating the source and sending traffic decoy

nmap --script vuln 157.230.43.191 #use all vuln scripts and run on the network.
```
Collection og useful [scripts](https://nmap.org/nsedoc/categories/)

default is -T3 speed

and more at `man nmap`

