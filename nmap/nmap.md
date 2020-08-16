### Nmap

```bash
nmap -sP 157.230.43.191 
# p-ping all hosts to the network

nmap -sT -p 80,443 157.230.43.191 
# T-tcp connect/full open scan intrusive to networks

nmap -sS -p 80,443 157.230.43.191 
# S-SYN/stealt/half open scan

nmap -sT 157.230.43.191 
# scan 1000 ports

nmap -O 157.230.43.191 
# ping.open ports and os detection

nmap -A 157.230.43.191 
#A-os,version of protocol, script scanning,trace route

nmap -sS -D 1.1.1.1 157.230.43.191 
#D-duplicating the source and sending traffic decoy

nmap --script vuln 157.230.43.191 
#use all vuln scripts and run on the network.
```
Collection og useful [scripts](https://nmap.org/nsedoc/categories/)

default is -T3 speed

and more at `man nmap`

### Using the NSE

```bash

ls -al /usr/share/nmap/scripts 
#nmap scripts and the nse files

ls -al /usr/share/nmap/scripts | grep -e "http-enum" 
#search for nse scripts with http-enum

nmap --script-updatedb  
#update scripts db

nmap -sn 192.168.1.142  
#Ping Scan - disable port scan

nmap -sV 192.168.1.142  
#Probe open ports to determine service/version info

nmap -p 21 --script ftp-anon 192.168.1.142 
#run ftp-anon script on target (noisy)

nmap -p 21 --script ftp-anon,ftp-vsftpd-backdoor 192.168.1.142 
#run combination of ftp scripts

nmap -p 21 --script "ftp-*" 192.168.1.142  
#wildcard match and run all the ftp scripts
```

### Banner Grabbing

```bash
sudo nmap -p22,80 --script banner 192.124.34.123

sudo nmap -F -T4 --script banner 192.124.34.123
#fast scan famous 1000 ports
```

### FTP Enumeration
```bash
ls -al /usr/share/nmap/scripts | grep -e "ftp"
#ftp scripts

nmap -sV 192.168.1.149 192.232.231.213
#version scan on two ports

sudo nmap -p 21 -sS --script ftp-anon,ftp-syst,tftp-enum,ftp-vsftpd-backdoor 192.172.242 192.168.1.32
#scan port 21 for ftp vulns on two hosts
```

### DNS Enumeration

```bash

ls -al /usr/share/nmap/scripts | grep -e "dns-"
#list dns nse scripts

sudo nmap --script dns-zone-transfer --script-args dns-zone-transfer.server=nsztm1.digi.ninja,dns-zone-transfer.port=53,dns-zone-transfer.domain=zonetransfer.me
#dns zone transfer
#gives mail servers and plain txt files along with A records and subdomains.

nmap -Pn --script dns-brute --script-args dns-brute.threads=5,dns-brute.hostlist=/usr/share/wordlists/SecLists/Discovery/DNS/fierce-wordlists.txt zonetransfer.me
#brute force DNS servers
# -Pn ==> Treat all hosts as online -- skip host discovery
```

### SMTP Enumeration

```bash
#SMTP = Simple mail transfer protocol //sending mails
#ICMP //receiving emails

ls -al /usr/share/nmap/scripts | grep -e "smtp" 
#list smtp nse scripts

sudo nmap -p25 --script smtp-commands 192.123.12.145
#list all supported smtp commands
#VRFY is useful and find mailbox and username of users.

sudo nmap -p25 --script smtp-enum-users --script-args smtp-enum-users.methods={VRFY} 192.123.12.145
#find users and run VRFY command in the SMTP server 

sudo nmap -p25 --script smtp-enum-relay 192.123.12.145
#connect and send emails using open relays and helps bypass authentication
```

### HTTP Enumeration

`Detecting HTTP Methods`

```bash

ls -al /usr/share/nmap/scripts/ | grep -e "http"
#list http scripts in the nse

nmap -Pn -sV 80 -T4 --script http-methods --script-args http-methods.test=all nmap.scanme.org
#gives banner and http methods supported by the server
```


