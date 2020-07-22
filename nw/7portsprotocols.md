### Ports/Protocols

Ports and protocols are essential comunication topics 

### Ports

Communication endpoints

- ports allow us to have multiple apps to use network connection,several apps can comunciate over ports
- 65,535 per net registration pn a device
- some are assigned 
    - ports are seen as 192.168.0.13:80 => port 80
- Communicate over TCP/UDP

### Protocols 
- Alot of the communication that we normally do have default ports associated.
    - Default ports can however be changed.
- HTTP
- FTP
- DNS
- POP3
- SSH
- IMAP
- SMTP

Common ones are HTTP/HTTPS have default ports assigned to them.
FTP,SMTP also have default ports but can also be changed


### FTP :21 - TCP
- File transfer Protocol
- Insecure not encrypted
### SFTP :22 - TCP
- Encrypted with the use of SSH
- More secure than FTP
### SMTP :25 - TCP
- Simple Mail Transfer Protocol
### POP3 :110 - TCP
- Post Office PRotocol 3
- Client download from server.
### HTTP :80 - TCP
- Hyper Text Transfer Protocol
- Seen in web Browsers
- Browsers sends a "GET" request
    - All a webpage is a file with text inside.
    - All info in clear text
### HTTPS :443 - TCP
- Encrypted HTTP
- Certificate betweem client/server
    - Info not in clear text
    - This is especially needed for personal information.
