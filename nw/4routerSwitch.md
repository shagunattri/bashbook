### Routing and Switching

#### Switching 
Switching happens on the same n/w internally (in and around the n/w)
- Layer 2 OSI 


#### Routing 
Communicating b/w different n/ws.
- Layer 3 OSI


### Networking Devices
- Hub
- Switch
- Router
- Repeater

### Hub

issa Dumb device

It receives data/sends to everyone.Everyone connected to the hub

The computer decides to either accept/reject the communication.

### Switch
A smarter version of hub.

It tracks different computer and devices connected to it and does it by making tracks in table of mac addresses

- Layer 2 of OSI

It records MAC address used by different ports within the device and keeps track of what port a specific mac address is connected to and makes sure the info is sent to the right port.

In the beginning it acts as a hub untill tables of the DHCP server gets populated.


### Repeaters

Compared to hub and swiich it has a different purpose and is 
used to make signal stronger.

It does it in two ways:
- Amplify
Increase the power of the signal to extend the range of transmission.

- Signal regeneration
Clean up signal and avoid interference to help in preserving the packets.

### Router

A Real smart device.

when compared to others it manages both the internal and the public network.
- manage traffic flow
- has built in firewalls
- has public/private IP
- DHCP server built in

Some Routers have  public and private ip with built in firewall

### DHCP server 

Pc has mac address but no IP address which is given by the DHCP server.

The client pc tries to `discover` DHCP server

The dhcp server makes an `offer` to the client 

Client `requests` for an IP from the DHCP server

`ACK` request from DHCP to client

DHCP server `assigns` IP to client and send acknowledgement(ACK).

