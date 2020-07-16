### IP addresses

IPV4 and IPV6 are the main versions of ip addr we use and are
- ip addresses are logical addr
- not hard coded
- can be changed by the router and on disconnection
- can also be changed by the ISP


### Public and private IP addr

`private` - used and defined internally in a nw

**Eg** - computer to the router give by the ip

>Internal n/w is controlled by the router based on the ip distribution table in the dhcp sercver.

The public given by your isp
Public ip is shown and logged by the internet site when you visit sites.

To scan and see your public addr
`myip.com` - shows the public addr

### IPV4
is old and moving adoption to ipv6 addrs.
- ipv4 consists of 32 bit addresses as computers can understand binary lang.
- divided into 4 sets of 8 binaries
- translated into nos representing binaries.



*binary representation of ip address*

11011011.11101110.00000111.00000011


1  |1 |0 |1 |1|0|1|1|
---|--|--|--|-|-|-|-|
128|64|32|16|8|4|2|1|

=> 128+64+16+8+2+1 -> 219

***ipv4***
- only 4 billion addresses
- too many connected devices require ip address

***ipv6***
- 128 bits 
- hexadecimal format
- each character is4 binary

`fe80::b504::`

|Decimal |Hexadecimal|
|----|---|
|0   |0|
|1   |1|
|2   |2|
|3   |3|
|4   |4|
|5   |5|
|6   |6|
|7   |7|
|8   |8|
|9   |9|
|10  |A|
|11  |B|
|12  |C|
|13  |D|
|14  |E|
|15  |F|

fe80 => 1111111010000000

|f| | | |
|-|-|-|-|
|1|1|1|1|
|8|4|2|1|

|e| | | | 
|-|-|-|-|
|1|1|1|0|
|8|4|2|1|


>double colons in ipv6 to be filles with zeros 

fe80::b504 => f380::0000b504::0000xxxx::0000xxxx
