## HTTP,Cookies,Sessions

>What happens when you visit a URL?

- DNS Request
What happens when you type a URL and press enter?

1.Client asks DNS Recursive Resolver to lookup a hostname (shagun.xyz).

2.DNS Recursive Resolver sends DNS query to Root Nameserver
    •Root Nameserver responds with IP address of TLD Nameserver (".xyz" Nameserver)

3.DNS Recursive Resolver sends DNS query to TLD Nameserver
    •TLD Nameserver responds with IP address of Domain Nameserver ("shagun.xyz" Nameserver)


4.DNS Recursive Resolver sends DNS query to Domain Nameserver
    •Domain Nameserver is authoritative, so replies with server IP address.

5.DNS Recursive Resolver finally responds to Client, sending server IP address (127.72.xxx.xxx)



### DNS - Domain Name System
Translation

Translates user friendly domain names into IP addresses.

Browser makes the request to the DNS server and is in form of a query

>What is the IP addr of shagun.xyz?

An DNS server responds with a response with the IP addr of shagun.xyz

>How does the "DNS Server work?"

The client asks the DNS recursive resolver for the addr
                        |
                        |
    takes the responsibility of finding the IP addr
    and doing necessary work and can take multiple 
     cycles/steps thus recursive resolver.

There are root NS(name servers) hard-coded in every DNS resolver run by various orgs.

DNSRR asks the rootNS for the ip addr and it doesn't know cause it;s new and then forwards to other NS and 
find the domain and suggests a NS that hosts all .xyz DNS queries and is called the **Authoritative DNS Server** and 
gives the ip addr.


ALso known as TLD NS as it hosts all the top level domains of .xyz

DNS + HTTP

After resolving the query from the DNS server,it is then time to connect to the service/server
with a HTTP connection.

The client initiates a HTTP request and is provided with a HTTP response.

An attack surface of this involves HTTP as HTTP queries are carried out in plain-text.


TLS fixes ar tof the problem, where
TLS allows for: 
- Encryption
- HTTPS in browser
- Integrity of data sent
- Authencity of data using signatures

##Attack on DNS

- DNS Hijacking

YOu as client try to connect to a server but as the DNS resolver is hijacked it redirects you to a malicious server
instead of the server you are trying to connect.

-   Attacker changes DNS records of target to point to own IP address
 •   All site visitors are directed to attacker's web server
-  Motivation
 •   Phishing
 •   Revenue through ads, cryptocurrency mining using Cryptominers in js is also a way to mine.



## DNS hijacking vectors
- Malware changes user's local DNS settings
- Hacked recursive DNS resolver -> mostly provided by your ISP
- Hacked router
- Hacked DNS nameserver
- Compromised user account at DNS provider


Services like Let's Encrypt provide free certificates to get HTTPS certificate to verify and trust.

An attacker can abuse this to harm you even over HTTPS.

If 

