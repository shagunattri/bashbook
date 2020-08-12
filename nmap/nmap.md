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

### Using the NSE

```bash

ls -al /usr/share/nmap/scripts #nmap scripts and the nse files

ls -al /usr/share/nmap/scripts | grep -e "http-enum" #search for nse scripts with http-enum

nmap --script-updatedb  #update scripts db

nmap -sn 192.168.1.142  #Ping Scan - disable port scan

nmap -sV 192.168.1.142  #Probe open ports to determine service/version info

nmap -p 21 --script ftp-anon 192.168.1.142 #run ftp-anon script on target (noisy)

nmap -p 21 --script ftp-anon,ftp-vsftpd-backdoor 192.168.1.142 #run combination of ftp scripts

nmap -p 21 --script "ftp-*" 192.168.1.142  #wildcard match and run all the ftp scripts
```
