### DNS

Domain Name Service

Part of the n/w that resolves domain and urls in actual IP from the fully qualified domain names.

- Resolve FQDN -> IP
    - eg:www.google.com -> 123.24.43.21

The client in the local n/w has a server and DNS server connected to the router.

The client computer will have a host cache/file to look for the domain name in the cache if the site is not present,
from the router it then transfers request to DNS server which queries and provides result then.

 If the DNS server is also not able to lookup the site,it then asks for external DNS to find the site.
 Finally adds the record in its DNS server and connects to the site.
 
