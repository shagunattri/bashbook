What is their autonomous system number?

An autonomous system number (ASN) is a global identifier of a range of IP addresses. If you are a very, very large company like Google you will likely have your own ASN for all of the IP addresses you own.

We can put the IP address into an ASN lookup tool such as https://www.ultratools.com/tools/asnInfo

On Shodan.io, we can search using the ASN filter. The filter is `ASN:[number]` where number is the number we got from earlier, which is AS14061.

Knowing the ASN is helpful, because we can search Shodan for things such as coffee makers or vulnerable computers within our ASN, which we know (if we are a large company) is on our network.

On the Shodan.io homepage, we can click on "explore" to view the most up voted search queries. The most popular one is webcams.

https://www.shodan.io/explore

One of the other most up voted searches is a search for MYSQL databases.

https://www.shodan.io/search?query=product%3AMySQL

If we look at the search, we can see it is another filter.

`product:MySQL`

Knowing this, we can actually combine 2 searches into 1.

We use this search query

`asn:AS14061 product:MySQL`

https://www.shodan.io/search?query=asn%3AAS14061+product%3AMySQL

Shodan has many powerful filters. My favourite one is the vuln filter, which let's us search for IP addresses vulnerable to an exploit.

Let's say we want to find IP addresses vulnerable to Eternal Blue:

`vuln:ms17-010`

However, this is only available for academic or business users, to prevent script kiddies from abusing this!

Here are some nice filters we can use on Shodan:

- City
- Country
- Geo (coordinates)
- Hostname
- net (based on IP / CIDR)
- os (find operating systems)
- port
- before/after (timeframes)

https://github.com/beesecurity/How-I-Hacked-Your-Pi-Hole/blob/master/README.md

The API lets us programmatically search Shodan and receive a list of IP addresses in return. If we are a company, we can write a script to check over our IP addresses to see if any of them are vulnerable.
