### VPN -Protocols IPSec

VPN - Web Protocols

- SSL(Secure Socket Layer)
    - Web based VPN(HTTPS)
    - Uses Certificate for mutual Auth
    - Mostly replaced by TLS

- TLS(Transport Layer Security)
    - More common for  HTTPS
    - Certificates
- TLS 1.2 
    - Enhanced Security
    - Tighter security/Hashing checks

### L2TP (Layer 2 Tunneling Protocol)
- Carries Layer 2 Traffic over Layer 3
- No encryption by itself but utilizes IPSec
- L2TP is therefore for our transport mechanism and IPSec is our encryprion and authentication measure.

### IPSec - IP Security

- Encrytps data at Layer 3
    - has 4 sub protocols

ESP - Encapsulating Security Payload
- Encrypts contentwith SYM algorithms

AH - Authentication Header
- Creates checksums and hashes packets

IPcomp - IP Payload Compression
- Compress IP payload the AH + ESP

IKE - Internet Key Exchange
- Negotiates shared secret

### Tunneling Keys

**Sender**

1 Negotiate Key

2 Encrypt the data with ESP

3 AH - Add Authentication Header

4 Add a new encrypted layer arount the entire block

**Receiver**

5 Remove outer encryption layer

6 Check and remove Header

7 Decrypt Data

VPN protocol ps and its working
