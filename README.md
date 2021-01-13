### CC: Steganography

steghide extract -sf jpeg1.jpeg -p password123


- Privilege Escalation

privilege escalation is such a large topic that it would be impossible to do it proper justice in this type of room. However, it is a necessary topic that must be covered, so rather than making a task with questions, I shall provide you all with some resources.

General:

https://github.com/swisskyrepo/PayloadsAllTheThings (A bunch of tools and payloads for every stage of pentesting)


Linux:

https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/ (a bit old but still worth looking at)

https://github.com/rebootuser/LinEnum (One of the most popular priv esc scripts)

https://github.com/diego-treitos/linux-smart-enumeration/blob/master/lse.sh (Another popular script)

https://github.com/mzet-/linux-exploit-suggester (A Script that's dedicated to searching for kernel exploits)


https://gtfobins.github.io (I can not overstate the usefulness of this for priv esc, if a common binary has special permissions, you can use this site to see how to get root perms with it.)


Windows:


https://www.fuzzysecurity.com/tutorials/16.html  (Dictates some very useful commands and methods to enumerate the host and gain intel)


https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp (A bit old but still an incredibly useful script)


https://github.com/411Hall/JAWS (A general enumeration script)



impacket is a collection of extremely useful windows scripts. It is worth mentioning here, as it has many scripts available that use samba to enumerate and even gain shell access to windows machines. All scripts can be found https://github.com/SecureAuthCorp/impacket.


