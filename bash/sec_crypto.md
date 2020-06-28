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

### To check for authenticity of downloads

download file
if hash match it is safe
or else it is backdoored yada/yada


given the ciphertext you cannot figure out the text without the key 
decrypting the ciphertext with key and input gives the message back



## commitment scheme

## Symmetric key cryptography

Uses:
- Applications

    Encrypting files for storage in an untrusted cloud service. This can be combined with KDFs, so you can encrypt a file with a passphrase. 
    Generate key = KDF(passphrase), and then store encrypt(file, key).

## Asymmetric Key Cryptography
```
keygen() -> (public key, private key)  (this function is randomized)

encrypt(plaintext: array<byte>, public key) -> array<byte>  (the ciphertext)
decrypt(ciphertext: array<byte>, private key) -> array<byte>  (the plaintext)

sign(message: array<byte>, private key) -> array<byte>  (the signature)
verify(message: array<byte>, signature: array<byte>, public key) -> bool  (whether or not the signature is valid)
```

Eg: RSA
Applications: 
- E-mail Encryption
- Sign software

have PGP hosted onsite and send the mail with it to decrypt the contents with your own private key

### Key Distribution
To map public keys and web-of-trust.

## Signature
the sign() fn takes message and private key to produce signature

fn verify-> takes the message the sigature and the public key -> then returns a boolean value.

Signatures have the property 
- without the private key its hard to produce a signature such that gives a true value

## tools
- sha1sum -> generate sha1 from stdin
- openssl
stdin
