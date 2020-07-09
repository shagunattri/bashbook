### Cross-Site Request Forgery and Same Origin Policy


 To make cookie Path secure 

 - Initially it is not safe to rely on path.
 - Cookies can only be accessed by equal or more specific domains ,so use subdomains.
 
 - Set path to the root of the site and don't rely on it 
 
```javascript
 Set-Cookie: key = value; Secure; HttpOnly; Path=/
 ```

### The Problems with Ambient Authority

Even with AA,it is Unclear which site initiated a request

Consider this HTML embedded in attacker.com:

```HTML
<imgsrc='https://bank.example.com/withdraw?from=bob&to=mallory&amount=1000'>
```

Browser helpfully includes bank.example.com cookies in all requests to bank.example.com, even though the request originated from attacker.com

 
### Cross-Site Request Forgery(CSRF)

- Attack which forces an end user to execute unwanted actions on a web app in which they're currently authenticated

- Normal users: CSRF attack can force user to perform requests like transferring funds, changing email address, etc.

- Admin users: CSRF attack can force admins to add new admin user, or in the worst case, run commands diretly on the server

- Effective even when attacker can't read the HTTP response

```javascript

erver.js: const BALANCES = {
    alice: 500,
    bob: 100
}
app.get('/', (req, res) => {
        const sessionId = req.cookies.sessionIdconst username = SESSIONS[sessionId]
        if (username) {
            res.send(`      Hi ${username}. Your balance is $${BALANCES[username]}.      <form method='POST' action='http://localhost:4000/transfer'>        Send amount:        <input name='amount' />        To user:        <input name='to' />        <input type='submit' value='Send' />      </form>    `)
        } else {
            createReadStream('index.html').pipe(res)
        }
    })...app.post('/transfer', (req, res) => {
            const sessionId = req.cookies.sessionIdconst username = SESSIONS[sessionId]
            if (!username) {
                res.send('fail!') return
            }
            const amount = Number(req.body.amount) const to = req.body.to BALANCES[username] -= amount BALANCES[to] += amount res.redirect('/')
            })
```



```HTML

attacker.html
<h1>Cool cat site</h1>
<imgsrc='cat.gif' />
<iframesrc='attacker-frame.html' style='display: none'></iframe>

attacker-frame.html:

<formmethod='POST' action='http://localhost:4000/transfer'>
        <inputname='amount' value='100' />
        <inputname='to' value='alice' />
        <inputtype='submit' value='Send' />
        </form>
        <script>
            document.forms[0].submit()
        </script>
```





### Mitigating CSRF

In short, the following principles should be followed to defend against CSRF:

- Check if your framework has built-in CSRF protection and use it
     - If framework does not have built-in CSRF protection add CSRF tokens to all state changing requests (requests that cause actions on the site) and validate them on backend
- Always use SameSite Cookie Attribute for session cookies
    - Implement at least one mitigation from Defense in Depth Mitigations section
    - Use custom request headers
    - Verify the origin with standard headers
    - Use double submit cookies
- Consider implementing user interaction based protection for highly sensitive operations
- Remember that any Cross-Site Scripting (XSS) can be used to defeat all CSRF mitigation techniques!
- Do not use GET requests for state changing operations.
    - If for any reason you do it, you have to also protect those resources against CSRF


### SameSite Cookies

- Use SameSite cookie attribute to prevent cookie from being sent with requests initiated by other sites
 - SameSite=None - default, always send cookies
 - SameSite=Lax - withhold cookies on subresource requests originating from other sites, allow them on top-level requests
 - SameSite=Strict - only send cookies if the request originates from the website that set the cookie

```javascript
Set-Cookie: key=value; Secure; HttpOnly; Path=/; SameSite=Lax
```

We know that lax is the best option we have here for SameSite Cookies,and google also has a proposal to make SameSite=Lax by default.

- "First, cookies should be treated as "SameSite=Lax" by default.Second, cookies that explicitly assert "SameSite=None" in order to enable cross-site delivery should also be marked as "Secure".
- Who would want to opt into SameSite=None cookies?

This would also affect ad-tracking as bad behaviour.

### How long should cookies last?

-  Use a reasonable expiration date for your cookies
  - 30-90 days
  - You can set the cookie with each response to restart the 30 day counter, so an active user won't ever be logged out, despite the short timeout

 Set-Cookie: key=value; Secure; HttpOnly; Path=/;
 SameSite=Lax; Expires=Fri, 1 Nov 2019 00:00:00 GMT

### Implementing Measures

```javascript
res.cookie('sessionId', sessionId, {
    secure: true,
    httpOnly: true,
    sameSite: 'lax',
    maxAge: 30 * 24 * 60 * 60 * 1000 // 30 days
}) res.clearCookie('sessionId', {
    secure: true,
    httpOnly: true,
    sameSite: 'lax'
})
```


### Imp. Points

- Cookies are used to implement sessions
- Never trust data from the client!
- Ambient authority is useful but opens us up to additional risks

Set your cookies like this:
```javascript
Set-Cookie: key=value; Secure; HttpOnly; Path=/;SameSite=Lax; Expires=Fri, 1 Nov 2019 00:00:00 GMT
```


### Same Origin Policy

Same origin is the core and fundamental security model of the web where two different pages form different sources should not be allowed to interact/interfere with each other.
It restricts how documents and scripts from one origin can interact with resources on another origin.

The browser is capable of loadin multiple sites from different sources in many tabs and sites can embed multiple iframes from different sites.
If there is no SOP the attacker can run scripts and expose user's browser.

 Given two separate JavaScript execution contexts, one should be able to access the other only if the protocols, hostnames, and port numbers associated with their host documents match exactly.
 This "protocol-host-port tuple" is called an "origin".


SOP prevents this from happening by blocking read access to resources loaded from a different origin.
It can be implemented easily from Js itself and the SOP has a lot of technicalities and details involved to access content.


```javascript
function isSameOrigin(url1, url2) {
    return url1.protocol === url2.protocol && url1.hostname === url2.hostname && url1.port === url2.port
}
```

Browser allows a few tags to embed resources from a different origin but can expose the site to clickjacking attacks using iframes,which can be restricted by disabling cross-origin reading using the Content Security Policy(CSP).

Generally, embedding a cross-origin resource is permitted, while reading a cross-origin resource is blocked.

### Same origin or not?

https://example.com/a/ → https://example.com/b/
>Yes!

https://example.com/a/ → https://www.example.com/b/
>No! Hostname mismatch!

https://example.com/ → http://example.com/
>No! Protocol mismatch!

https://example.com/ → https://example.com:81/
>No! Port mismatch!

https://example.com/ → https://example.com:80/
>Yes!


### document.domain

>The domain property of the Document interface gets/sets the domain portion of the origin of the current document, as used by the same origin policy.If this property is successfully set, the port part of the origin is also set to null.

- Idea: Need a way around Same Origin Policy to allow two different origins to communicate
- Two cooperating sites can agree that for the purpose of Same Origin Policy checks, they want to be considered equivalent.
- Sites must share a common top-level domain.

- Example: both login.stanford.edu and axess.stanford.edu may perform the following assignment:

`document.domain = 'stanford.edu'`

*document.domain requires opt-in*

- Both origins must explicitly opt-in to this feature
- So, if attacker.stanford.edu runs:
    - document.domain = 'stanford.edu'
- Then attacker.stanford.edu still cannot access content on stanford.edu!
- stanford.edu also needs to run the same code to opt-in to this behavior:
  - document.domain = 'stanford.edu'


### Why document.domain is a bad idea.

In order for login.shagun.xyz and github.shagun.xyz to communicate, they must set:
document.domain = 'shagun.xyz'
This allows anyone on shagun.xyz to join the party

Example: attacker.shagun.xyz can also set document.domain to shagun.xyz to become same origin with the others


### Sending messages from a parent page to a child iframe
 A way around Same Origin Policy to allow two different origins to communicate

 Use the postMessage API

