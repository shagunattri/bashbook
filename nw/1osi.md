### What is networking & the OSI model


Networking is two or more devices connected such that they can communicate with one another.


N/w is complicated,think of it as shipping where it sounds simple but the many small steps and different procedures one has to take care of 
when shipping a parcel from the dock to your front door is not that simple.

The same applies to n/wing where a number of steps combine and run in the background to make this communication possible.

A full picture and details of networking can be best explained using the OSI model.

### OSI Model
OSI model is the defining n/w model that explains the different aspects/details happening over a n/w when we are communicating.


The OSI model consist of seven layers:

- Layer 1 - Physical Layer(Lowest Level)
- Layer 2 - Data Link Layer
- Layer 3 - Network Layer
- Layer 4 - Transport Layer
- Layer 5 - Session Layer
- Layer 6 - Presentation Layer
- Layer 7 - Application Layer(Highest Level)

Physical layer is the lowest level layer mostly dealing with cable/electric bytes.

Application layer the highest level where you are interacting with the frontend.


### How does the OSI model works

Consider two computers,Computer A and Computer B where A is sending data to B,A is starting from the application layer and going
 down to the physical layer,transfering data to computer B which is on the receiving end where the data from its lowest level layer to interacting with the data in the 
 application layer is ready to present in the Application layer.


#### Layer 1 - Physical Layer
mostly contains 
- Cables/Bites

It Includes
- Pinouts
- Voltages
- Cable Specifications
- NIC(N/w interface cards)

In this layer the interaction is mostly electric impulses transfering through the cable.

Most of the work is very low level and not code.

#### Layer 2 - Data Link Layer

In this layer the packaged bits/data is transformed into frames and where the MAC address[^mac] resides.

It can be spoofed but the original MAC cannot be altered.All that layer 2 is doing is getting data from one point to another.

#### Layer 3 - N/w layer

referred to as IP[^ip] layer
- Transfers logical address 
- performs network routing


This layer introduce IP addrs which are - 
- logical
- Not hardcoded addr
- Not unique,can be changed by ISP or you

Thi layer does the n/w routing and distributing the pkgs based on the IP and sorting who gets what based on the IP addr on the pkgs that is going to be transfered.

#### Layer 4 - Transport Layer

- Management and Control layer 
- Transfer of data
    - TCP connection oriented protocol
    - UDP connectionless protocol

- Split communication into packages

This layer deals with protocol and spliting the communication from layer above into available protocols.

#### Layer 5 - Session Layer

- Traffic control(Establish,Manage,terminate connections)
- coordinate communication

This layer is responsible for controlling traffic along with 

taking charge of how much and when we are allowed to send data.

It establishes connection online to services and is incharge of terminating connections when they are not in use/not required.

#### Layer 6 -Presentation Layer

- Format Data
    - Encryption/Decryption
below application layer

The data in this layer transforms data  into a format our application can understand before being presented to the application.

#### Layer 7 - Application Layer

- Network access
- Enables Apps to access the network
    - SMTP
    - HTTP
    - FTP

This is where the data is finally presented and accessed by the application over n/w protocols such as SMTP,FTP,HTTP...




[^mac]:A unique address to n/w card.
[^ip]:An IP addr is a logical addr and it's not hard coded.
