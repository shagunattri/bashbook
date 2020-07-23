### Data Hashing

- One way mathematical algorithm
- Like a fingerprint
- File Verification/PKI
- Password Hashing

- Changing 1 value in text changes the total hash
- You cannot run the hash through the algo to give back original text
- Can sometimes output same value of hash in some cases.

### Password Hashing
- Enter usernamae and password
- Get the password and run through the hashing algorithm where the hash key produced and checked against stored password hash key if the same they are let in.

#### Public key infrastructure(PKI) also uses Data Hashing

For file validation

1 Signing part

where the data is run through a hashing fn where the hash then take it encrypt it with his private key
then certificate + encrypted value are generated to then data is encrypted to be attached to the data
and output Digitally signed data.

2 Verification

Take the digital signed data where it then is divided the data and use the publickey to decrypt the hash value
and use private key to decrypt the data and then use check the hash of data sent and data recieved to then verify the message.

tools4noobs.com/online_tools/hash

