### MAC Addresses


Mac address is synonym for Media Access Controller
- unique addr
- tied to NIC(n/w interface card and wireless)
- layer 2 of OSI model
- hard coded into the NIC for cable card as well as wireless card
- hexadecimal format
- ipaddr => [layer 3]
- macaddr => [layer 2]



who chooses mac addresss=> the manufactures

- They are given range based on producer

to look up your n/w card
$ ip/fconfig
`macvendorlookup.com`
this provides gives 
- address
- range
- type


what is the MAC address used for?
>It helps them identify when the devices are connected to the n/w

Without a mac addr computers would not be able to identify themselves on a n/w before they
get an IP assigned.


when we setup a n/w and connect our computers to the n/w no ip is distributed and they don't 
know the other devices where it asks the router/dhcp server to take the IP
and the device and router use the mac addr to communicate and assign ip addr later.

### cast measures in n/w

`unicast` => 1=> 1

`multicast` 1=> many
casting info to many devices

`broadcast` => any computer in the broadcast domain gets the message

In a n/w the broadcast domain is all the computers that can be reached by the mac addr
internally within the router


