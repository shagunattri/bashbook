Web scanning represents one of the core constructs of modern pen testing. Quite simply, most of what we interact with on a daily basis is the internet, and therein there is a multitude of ever-widening number of vulnerabilities. Within this room, we will investigate two of the most common scanners: Nikto and Zap. 

what switch do we use to set the target host?

`-h`

How do we disable secure transport?

`-nossl`

 how do we force secure transport?

 `-ssl`

What if we want to set a specific port to scan?

`-p`

 how do we verify that this database is working and free from error?

 `-dbcheck`

 Which switch and numerical value do we use to set Nikto to enumerate usernames in Apache?

 `-mutate 3`

 how do we set Nikto to do a credentialed check? Suppose the username is admin and the password is PrettyAwesomePassword1234

 `-id admin:PrettyAwesomePassword1234`

 which switch do we set in order to limit the scan to end at a certain time?

 `-untill`

 How do we list all of the plugins are available?
 
 `-list-plugins`

 Which switch do we use to instruct Nikto to use plugin checks to find out of date software on the target host?

 `-Plugins outdated`

 to run a series of standard tests against the target host?

 `-Plugins tests`

Which plugin checks if you can enumerate apache users?

`apacheusers`

How do you update the plugin list

`-update`

