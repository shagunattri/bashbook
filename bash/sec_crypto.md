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

## Commmitment scheme

A way to visualize a commitment scheme is to think of a sender as putting a message in a locked box, 
and giving the box to a receiver. The message in the box is hidden from the receiver, who cannot open the lock themselves. 
Since the receiver has the box, the message inside cannot be changed—merely revealed if the sender chooses to give them the key at some later time.

Interactions in a commitment scheme take place in two phases:

    the commit phase during which a value is chosen and specified
    the reveal phase during which the value is revealed and checked

## tools
-sha1sum -. generate sha1 from stdin

## Key dervation functions(KDF)

### Properties
- is slow to compute

PBKDF2 -password based KDF2

## Symmetric key cryptography

Fns.
- Key generation fn keygen()
- encrypt (text,key) => ciphertext
- decrypt (ciphetext,key) => plaintext 
- 
