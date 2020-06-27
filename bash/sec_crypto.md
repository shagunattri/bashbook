## Security & Cryptography

hash functions - git
public keys - ssh

Entropy is a measure of randomness. This is useful, for example, when determining the strength of a password
Measured in bits

log2(#possibilites)


## hash functions
A cryptographic hash function maps data of arbitrary size to a fixed size, and has some special properties. A rough specification of a hash function is as follows:
sha1 => input of bits => 160 bits of o/p

Properties:
- non-invertible
- collision resistant

 Why git uses cryptographic hash fns. ?
- to prevent conflicts in hash fns. to prevent hash collision

sha1sum of files help know authencity

publish hash of file -> 160 bits of data

download file
if hash match it is safe
or else it is backdoored yada/yada

## commitment scheme

    

## tools
-sha1sum -. generate sha1 from stdin


