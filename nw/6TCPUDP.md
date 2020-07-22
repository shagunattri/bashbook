### TCP/UDP Protocol

- Common protocols in n/wing
- TCP(Transport Layer Protocol)
- UDP(User Datagram Protocol)

### TCP
- A coonection oriented protocol
- is 1 -> 1 oriented
- Initiate what is called a three way handshake.

SYN
SYN -ACK
ACK
ESTABLISHED CONNECTION

### TCP Packets
- Push data as a stream
- 20 byte header
- Dynamic body

communication is broken down into packets with a stream of data to be transfered over the network with a 20 byte header leaving 80 bytes of info to be send.

### UDP

- Does not have to verigy connection
- No three way handshake
- Not limited to 1-1, can be used to broadcast.

Package size matters 

with 8 byte header and makes changes in message which can be different sizes with full info.

