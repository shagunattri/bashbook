### Fingerprinting and Privacy on the Web


- Why websites track (and how much)
- “Classic” tracking
- Fingerprinting / “passive tracking”
- Fingerprinting counter measures
- Anti-finger printing exercise
- Privacy protections in Brave
- Wrapping up


### Birth of the Tracking
- Problem
    - Authentication?
    - Can’t log in every time
    - HTTP auth is terrible and limited
- Solution
    - Server gives token to user
    - User returns it on requests
    - Aka “cookies”

### “Ever-Cookies”
- Some browsers started fighting back
    - Brave, Safari, Firefox, extensions...
- Trackers fought back
    - Moving IDs information out of cookies, to other location
- Long list of locations
    - Local and Session Storage
    - HSTS[^HSTS]
    - Cache (etags, Cache API, etc)
    - Plugins
    - many many many more...

### Fingerprinting, what’s diff?
- Classic tracking
    - Website stores an id on the client
    - The client returns the id to the server (cookie or JS)
    - The id is what allows re-identification
- Fingerprinting / passive tracking
    - Website finds things different about each visitor
    - That difference allows re-identification

### Fingerprinting, how
- Large number of semi-identifiers
    - Browser size- Extra fonts
    - Audio hardware
    - Video hardware
    - Installed plugins
    - Color depth
    - etc etc etc...

### Succeeding at Fingerprinting
- Breath of fingerprints
    - Large number of semi-identifiers
    - User agent string
        - [History of the Browser user-agent string](https://webaim.org/blog/user-agent-string-history/)
        - Katamari-Damacy of identifiers
        - Brave / Chrome
            - Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.50 Safari/537.36 
        - Easy to extract
            - navigator.userAgent
            - User-Agent:
    - Installed fonts
        - Three categories of fonts
            - System
            - Local
            - Web
        - “Local” is the tricky part
            - Office
            - Photoshop
            - Goofery
        - Easy to extract
            - plugins
            - css + span + width 
    - Canvas / WebGL
        - Pixel Perfect: Fingerprinting Canvas in HTML5
            - Keaton Mowery and Hovav Shacham
        - Drawling APIs
            - e.g. Drawing lines / shapes
        - Standardized, but subtle differences
        - Easy to extract
            - Create canvas
            - Do some drawing
            - toDataURL() 
    - Hardware (many)
        - Many Web APIs leak capabilities
            - number of cores (HTML)
            - number of audio channels (Web Audio API)
            - num shaders and similar (WebGL API)
            - device memory (Device Memory API)
            - network (WebRTC, Network status API)
        - Semi identifying
        - Easy to extract
            - All browsers have subset of the above
            - Most platforms have no permissions 
    - Height / width
- Depth of fingerprints
    - How uniquely each identifier can...identify

### Fingerprinting in Practice
- Needs to be in a database...
- Hash each endpoint
- Hash each value into a single identifier...
- Nice implication: “poisionability”...

### Fingerprinting Countermeasures
- Remove the functionality
    - Delete JS end point
    - Remove the HTTP header
    - Remove the runtime capability 
- Make the functionality consistent
- Restrict access (permissions, 1p vs 3p, user gesture, etc)
    - Permission prompt
    - User gesture
    - 1p vs. 3p
    - “Site engagement” 
- Noise
- “Privacy budget”



### Further Reading

https://chromium.woolyss.com/f/OpenWPM-1-million-site-tracking-measurement.pdf

https://arxiv.org/pdf/1708.08510

https://blog.torproject.org/browser-fingerprinting-introduction-and-challenges-ahead

https://webkit.org/blog/8943/privacy-preserving-ad-click-attribution-for-the-web/

https://crypto.stanford.edu/safecache/sameorigin.pdf

https://webkit.org/tracking-prevention-policy/

https://hovav.net/ucsd/dist/geometry.pdf

https://panopticlick.eff.org/

[^HSTS]:https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security#HSTS_mechanism_overview

