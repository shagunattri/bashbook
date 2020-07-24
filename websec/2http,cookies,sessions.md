## HTTP,Cookies,Sessions

>What happens when you visit a URL?

### DNS Requests

1.Client asks DNS Recursive Resolver to lookup a hostname (shagun.xyz).

2.DNS Recursive Resolver sends DNS query to Root Nameserver

- Root Nameserver responds with IP address of TLD Nameserver (".xyz" Nameserver)

3.DNS Recursive Resolver sends DNS query to TLD Nameserver
- TLD Nameserver responds with IP address of Domain Nameserver ("shagun.xyz" Nameserver)

4.DNS Recursive Resolver sends DNS query to Domain Nameserver
- Domain Nameserver is authoritative, so replies with server IP address.

5.DNS Recursive Resolver finally responds to Client, sending server IP address (127.72.xxx.xxx)



### DNS - Domain Name System

It is bascially translation.

Translates user friendly domain names into IP addresses.

Browser makes the request to the DNS server and is in form of a query

>What is the IP addr of shagun.xyz?

An DNS server responds with a response with the IP addr of shagun.xyz

>How does the "DNS Server work?"
```bash
The client asks the DNS recursive resolver for the addr
                        |
                        |
                        *
                        *
    takes the responsibility of finding the IP addr
    and doing necessary work and can take multiple 
     cycles/steps thus recursive resolver.
```

There are root NS(name servers) hard-coded in every DNS resolver run by various orgs.

DNSRR asks the rootNS for the ip addr and it sometimes doesn't know the ipaddr as it is new and then forwards to other NS and 
find the domain and suggests a NS that hosts all .xyz DNS queries and that server is called the **Authoritative DNS Server** and 
gives the ip addr.


ALso known as TLD NS as it hosts all the top level domains of .xyz

### DNS + HTTP

After resolving the query from the DNS server,it is then time to connect to the service/server
with a HTTP connection.

The client initiates a HTTP request and is provided with a HTTP response.

An attack surface of here involves HTTP as ->  *HTTP queries are carried out in plain-text.*


TLS fixes a lot of these problems, where
TLS allows for: 
- Encryption
- HTTPS in browser
- Integrity of data sent
- Authencity of data using signatures

### Attack on DNS

- DNS Hijacking

You as client try to connect to a server but as the DNS resolver is hijacked and  redirects you to a malicious server
instead of the server you are trying to connect.

-   Attacker changes DNS records of target to point to own IP address
    - All site visitors are directed to attacker's web server

-  Motivation
    - Phishing
    - Revenue through ads, cryptocurrency mining using Cryptominers in js is also a way to mine.



## DNS hijacking vectors
- Malware changes user's local DNS settings
- Hacked/Compromised recursive DNS resolver -> mostly provided by your ISP
- Hacked/Compromised router
- Hacked/Compromised DNS nameserver
- Compromised user account at DNS provider


Services like Let's Encrypt provide free certificates to get HTTPS certificate to verify and trust your site.

An attacker can abuse this to harm you even over HTTPS.

Some ISPs also do DNS hijacking,for an invalid page an example for that is your ISP,which instead of the original site shows a relevant site/page of their own service or a notice from the government.

## DNS Privacy

As the queries are in plain-text and many ISPs sell your data.

You can use a different DNS provider to stay safe or make your own.

`DNS over HTTPS(DoH)` is a new concept to send even the DNS queries encrypted using the HTTPS protocol.

## HTTP

- `Client-server model` - Client asks server for resource, server replies
- `Simple` - Human-readable text protocol
- `Extensible` - Just add HTTP headers
- `Stateless` - Two requests have no relation to each other
- `Transport protocol agnostic` - Only requirement is reliability


### HTTP is Stateless

- Obviously, we interact with "stateful" servers all the time
- "Stateless" means the HTTP protocol itself does not store state
- If state is desired, is implemented as a layer on top of HTTP

### HTTP Status Codes

- 1xx - Informational ("Hold on")
- 2xx - Success ("Here you go")
- 3xx - Redirection ("Go away")
- 4xx - Client error ("You messed up")
- 5xx - Server error ("I messed up")

### HTTP Success Code

- 200 OK - Request succeeded
- 206 Partial Content - Reqest for specific byte range succeeded

### HTTP Redirection Codes

- 301 Moved Permanently - Resource has a new permanent URL
- 302 Found - Resource temporarily resides at a different URL
- 304 Not Modified - Resource has not been modified since last cached


### HTTP Client Error Codes

- 400 Bad Request - Malformed request
- 401 Unauthorized - Resource is protected, need to authorize
- 403 Forbidden - Resource is protected, denying access
- 404 Not Found - Ya'll know this one

### HTTP Server Error Codes

- 500 Internal Server Error - Generic server error
- 502 Bad Gateway - Server is a proxy; backend server is unreachable
- 503 Service Unavailable - Server is overloaded or down for maintenance
- 504 Gateway Timeout - Server is a proxy; backend server responded too slowly


### HTTP proxy servers
When to want to connect and combine different servers and ps into a single proxy.

When you have a proxy server it acts as a middleware b/w your server and client to send the request and responses.

 - Can cache content
 - Can block content (e.g. malware, adult content)
 - Can modify content
 - Can sit in front of many servers ("reverse proxy")
 
 Client site proxies are not generally gr8,but helps out for burp.
```
Client -> Server
       <-
```

>Sending HTTP using curl

```bash
curl shagun.xyz > shagun.html
```

#### HTTP Request

```bash
GET     /   HTTP/1.1
|       |       |
Method Path Protocol Version
```
#### HTTP Response

Contains additional key-value pair and metadata along with the file-data

```bash
HTTP/1.1           200              OK
|                   |               |
Protocol Version Status COde Status Message
```

### HTTP Headers

`Host: example.com`
 |          |
 Header   Header
 Name     Value

- Let the client and the server pass additional information with an HTTP request or response
- Essentially a map of key-value pairs
- Allow experimental extensions to HTTP without requiring protocol changes

### Useful HTTP request Headers

- Host - The domain name of the server (e.g. example.com)
- User-Agent - The name of your browser and operating system
- Referer - The webpage which led you to this page `(misspelled)`
- Cookie - The cookie server gave you earlier; keeps you logged in
- Range - Specifies a subset of bytes to fetch
- Cache-Control - Specifies if you want a cached response or not
- If-Modified-Since - Only send resource if it changed recently
- Connection - Control TCP socket (e.g. keep-alive or close)
- Accept - Which type of content we want (e.g. text/html)
- Accept-Encoding - Encoding algorithms we understand (e.g. gzip)
- Accept-Language - What language we want (e.g. es)

### Making HTTP request with headers

```bash
curl https://twitter.com --header "Accept-Language: es" --silent | grep JavaScript

curl https://twitter.com --header "Accept-Language: ar" --silent | grep JavaScript
```

### HTTP Response

```bash
HTTP/1.1 200 OK
Content-Length: 9001
Content-Type: text/html; charset=UTF-8
Date: Tue, 24 Sep 2019 20:30:00 GMT

<!DOCTYPE html ...
```

### Useful HTTP response headers

- Date - When response was sent
- Last-Modified - When content was last modified
- Cache-Control - Specifies whether to cache response or not
- Expires - Discard response from cache after this date
- Vary - List of headers which affect response; used by cache
- Set-Cookie - Set a cookie on the client
- Location - URL to redirect the client to (used with 3xx responses)
- Connection - Control TCP socket (e.g. keep-alive or close)
- Content-Type - Type of content in response (e.g. text/html)
- Content-Encoding - Encoding of the response (e.g. gzip)
- Content-Language - Language of the response (e.g. ar)
- Content-Length - Length of the response in bytes


### Protocol Stack

        HTML CSS JS
            HTTP
            TLS
            TCP
            IP


>Make a HTTP client in Nodejs.

#### METHOD 1
```Javascript
const net = require('net')
const socket = net.createConnection({
    host: 'example.com',
    port: 80
})
const request = `
GET / HTTP/1.1
Host: example.com
`.slice(1)

socket.write(request)
socket.pipe(process.stdout)
```
#### METHOD 2

```JS
const dns = require('dns')
const net = require('net')

dns.lookup('example.com', (err, address) => {
    if (err) throw err
    
    const socket = net.createConnection({
        host: address,
        port: 80  })
        
    const request = `
GET / HTTP/1.1
Host: example.com
`.slice(1)

    socket.write(request)
    socket.pipe(process.stdout)
})
```

#### What happens when you type a URL and press Enter

1.Perform a DNS lookup on the hostname (example.com) to get an IP address (1.2.3.4)

2.Open a TCP socket to 1.2.3.4 on port 80 (the HTTP port)

3.Send an HTTP request that includes the desired path (/)

4.Read the HTTP response from the socket

5.Parse the HTML into the DOM

6.Render the page based on the DOM

7.Repeat until all external resources are loaded:

8.If there are pending external resources, make HTTP requests for these (run steps 1-4)
    
9.Render the resources into the page


### Cookies

Cookies are set by the browser using the Set-Cookie Header on the client

```
Set-Cookie: theme = dark;
    |          |       |
Header      Cookie    Cookie
Name        Name        Name
```

To remember user prefences and more...

### Further Reading

https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview

https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies

https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers
