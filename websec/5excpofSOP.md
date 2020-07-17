### Exceptions to the SOP


#### postMessage API

an API that lets two site interact and talk with each other and send messages.
It requires an site to have a referance to the other website to send the message.

the site can listen to the message by adding an EventListener.

- Secure cross-origin communications between cooperating origins
- Send strings and arbitrarily complicated data cross-origin

- Useful features:
    - "Structured clone" algorithm used for complicated objects. Handles cycles. Can't handle object instances, functions, DOM nodes.
    - "Transferrable objects" allows transferring ownership of an object. It becomes unusable (neutered) in the context it was sent from.


parent.html:

```HTML
<h1>localhost:4000</h1>
<inputname='val' />
<br /><br />
<iframe src='http: //localhost:4001/child.html'></iframe>
    <script>
        const input = document.querySelector('input') const iframe = document.querySelector('iframe') input.addEventListener('input', () => {
            iframe.contentWindow.postMessage(input.value, 'http://localhost:4001')
        })
    </script>
```
child.html:

```HTML
<h1>localhost:4001</h1>
<div></div>
<script>
    const div = document.querySelector('div') 
    window.addEventListener('message', event => {
            if (event.origin !== 'http://localhost:4000') return 
            div.textContent = event.data
        }) 
< /script>
```
Messages sent from the child iframe is sent to the parent site but it doesn't check for the parent and sends the message anyway,this is could allow attacker.com to embed a login iframe and sees the who the user and it's details.
Thus we need to validate the destination of messages.

### Need to validate destination of messages!

- If an attacker embeds login.shagun.xyz, they can listen to it's message which reveals the name of the logged in user!

`Solution:` login.shagun.xyz should specify intended recipient origin. Browser will enforce this.

The additional parameter lets you send/block messages from origin if it doesn't match.

```javascript
const data = { name: 'shagun attri' }
window.parent.postMessage(data, 'https://github.shagun.xyz')
```

With the iframes embedded we are accepting messages from anyone who has our site embedded into theirs and it is a problem.
You can additonally check for the message origin and verify the message is legitimate or not,in order to make validate the source of message.


- If an attacker has a reference to a github.shagun.xyz  window (by e.g. embedding it in an iframe), they can send a message to it to trick it!
- Solution: github.shagun.xyz should verify source origin of message!

```javascript
window.addEventListener('message', event => {
    if (event.origin !== 'https://login.stanford.edu') return  
    setCurrentUser(event.data.name)
})
```

The issue with thi API design is error prone and forgetting to add this validation check.

### Integrity of postMessage

- Sender must specify origin which is permitted to receive message
    - In case the URL of the target window has changed
- Recipient must validate the identity of the sender
    - In case some other window is sending the message
- Remember: Always specify intended recipient or expected sender!


### Exceptions of the SOP

Summary: There are explicit opt-out mechanisms like document.domain, fragment identifier communication, and the postMessage API

- There are also automatic exceptions
    - Need to be aware of these!
    - Source of many security issues!
- Embedded static resources can come from another origin


- Ambient authority is implemented by cookies
- One consequence: attacker.com can embed user's real avatar from target.com:

```HTML
<h1>Welcome to your account!</h1><imgsrc='https://target.com/avatar.png' />
```

The solution to this issue would be using the `Samesite cookies` to prevent cookie from being sent with requests initiated by other sites.

Also `Referer header` allows the browser to tell the server that this server made the request.

- Inspect Referer HTTP header to look at the request
- Reject requests from origins not on an allowlist

But HTTP Cache is here to spoil the web.
- Add a Vary: Referer header
- Or, add a Cache-Control: no-store header

- Another gotcha: Sites can opt out of sending the Referer header!
    - Defeats this whole mechanism. So, just use SameSite cookies!


It is common that browser caches images and this cache could lead to issues as well.

An the attacker can refer to the attacker.com and get the img but the browser registers it as already cached and instead of requesting the server the http cache returns the img. and allow access of img to the attacker.

It generally doesnot check for all headers,but a header when it is diiferent the Vary header could stop accepting requests from the cache when the referer value is different.
You can use sameSite cookies to also defend against this.

### Cookies don't obey Same Origin Policy
- Cookies were created before Same Origin Policy so have different security model
- Cookies are **more specific** than Same Origin Policy
    - Path is ineffective because same origin pages can access each other's DOMs
- Cookies are **less specific** than Same Origin Policy
    - Different origins can mess with each others cookies (e.g. attacker.stanford.edu can set cookies for stanford.edu)
    - This is why Stanford login is login.stanford.edu and not stanford.edu/login

### Cookies + "legitimate" DNS hijacking
- If advertising page wants, it can steal cookies
    - nonexistent.example.com is different origin than example.com, yet can access cookies
- If advertising page contains a malicious third-party script, the script can steal cookies
- If advertising page contains a cross-site scripting issue (but example.com doesn't), then anyone can steal cookies
    - Attacker causes user to visit nonexistent.example.com/<some-attack-code>
    - DNS is hijacked by advertising page which includes <some-attack-code> in page
    - As before, nonexistent.example.com can access example.com cookies, even though it's another origin


### What is allowed?
- Is site A allowed to link to site B? 
>Yes!
- Is site A allowed to embed site B? 
>Yes!
- Is site A allowed to embed site B and modify its contents? 
>No!
- Is site A allowed to submit a form to site B? 
>Yes!
- Is site A allowed to embed images from site B? 
>Yes!
- Is site A allowed to embed scripts from site B? 
>Yes!
- Is site A allowed to read data from site B? 
>No!

### Important Points

- Same Origin Policy is the security model of the web
    - Two pages from different sources should not be allowed to interfere with each other
- To make your site secure, understand:
    - There are important exceptions to the Same Origin Policy (images, scripts, iframes, form POSTs)
    - Avoid using broken mechanisms like cookie Path and document.domain

### Can we prevent a site from linking to our site?
- Why do this?
    - Search Engine Optimization (SEO)
    - Make the linking site look bad?
- How might we accomplish this?
    - Can't prevent the link itself
    - Can we reject request?

One way to prevent linking is by using the referer header and checking it whenever a site refers to your site.

### Referrer-Policy HTTP header

- Referrer-Policy: unsafe-url
    - Send full URL.
- Referrer-Policy: no-referrer
    - Never send Referer
- Referrer-Policy: no-referrer-when-downgrade (default)
    - Send full URL. When HTTPS → HTTP downgrade, send nothing.
- Referrer-Policy: origin
    - All: Send origin instead of full URL.
    - sends the origin not the whole path of site where the link was attached
- Referrer-Policy: origin-when-cross-origin
    - Same origin: send full URL. Cross origin: send origin.
- Referrer-Policy: same-origin
    - Same origin: send full URL. Cross origin: send nothing.
- Referrer-Policy: strict-origin
    - Send origin. When HTTPS → HTTP downgrade, send nothing.
- Referrer-Policy: strict-origin-when-cross-origin
    - Same origin: send full URL. Cross origin: send origin. When HTTPS → HTTP downgrade, send nothing.


set by the site that has the links for it.


prevent linking is hard and is complex.


### Can we prevent a site from embedding our site?

- Why do this?
    - Prevent clickjacking attacks
- How might we accomplish this?
    - Check if we are framed via JavaScript (frame busting)
    - Need a new HTTP header!

*Look at busting frame busting paper => a study on clickjacking vulnerabilities on popular sites*

### Frame Busting
Is code where the site that is being framed and looks at its parent and finds out if it is being framed.

```javascript
if (window.top.location != window.location) {
    window.top.location = window.location
}

//Don't do this!
```
Better ways to do it now by using headers 

### X-Frame-Options HTTP Header
Let's you decide whether you want to embed site contents to another site.

- X-Frame-Options not specified (Default)
    - Any page can display this page in an iframe
- X-Frame-Options: deny
    - Page can not be displayed in an iframe
- X-Frame-Options: sameorigin
    - Page can only be displayed in an iframe on the same origin as the page itself
    - does not allow embedding in attacker.com if you are shagun.xyz


#### What does X-Frame-Options: 
#### sameorigin actually mean?

- What should happen if target.com embeds othersite.com which embeds target.com?
- Until recently, browsers performed a check only against top-level window
- Thus, attackers could set up a framing chain which would be allowed:
    - target.com embeds attacker.com embeds target.com


### Can we prevent a site from submitting a form to our site?
- Why do this?
    - Prevent cross-site request forgery (CSRF)
- How might we accomplish this?
    - Detect Origin header, use an allowlist
    - SameSite cookies
Samesite cookies prevent cookies to be sent but the form is never the less submitted.


### Can we prevent a site from embedding images from our site?
- Why do this?
    - Prevent hotlinking - another site linking to your site and uses all your bandwidth
    - Prevent user's logged-in avatar from showing up on other sites
- How might we accomplish this?
    - For hotlinking: Detect **Referer** header, use an allowlist (not foolproof)
    - For avatar: Use **SameSite cookies**
    - For avatar: Use an **unpredictable URL**


### Can we prevent a site from embedding scripts from our site?
- Why do this?
    - Prevent hotlinking
- Important notes
    - Scripts typically do not contain private user data
    - Scripts run in the context of the embedding site
- How might we accomplish this?
    - Detect Referer header, use an allowlist (not foolproof) 

```javascript
// typical cross origin script embed
<script src='https://ajax.googleapis.com/ajax/libs/d3js/5.12.0/d3.min.js'></script>
<script>  
    d3.select('svg').selectAll('rect').data(data).enter()
</script>
```

### What does Same Origin Policy allow?
- Is site A allowed to link to site B? Yes! Or no! (No is not foolproof)
- Is site A allowed to embed site B? Yes! Or no!
- Is site A allowed to embed site B and modify its contents? No!
- Is site A allowed to submit a form to site B? Yes! Or no!
    - Middle ground: SameSite prevents cross-origin cookie inclusion while still allowing form submission
- Is site A allowed to embed images from site B? Yes! Or no! (No is not foolproof)
- Is site A allowed to embed scripts from site B? Yes! Or no! (No is not foolproof)
- Is site A allowed to read data from site B? No!


### Is site A allowed to read data from site B?
No!
- Important: embedding an image, script, or iframe is not "reading data"
    - We could embed images, scripts, but not read the actual raw data in them
    - For iframes we couldn't access the DOM to read/write it
- This is precisely what we mean by "reading data":

```javascript
const res = await fetch('https://axess.stanford.edu/transcript.pdf')
const data = await res.body.arrayBuffer()
console.log(data)
```

### Is site A allowed to read data from site B?
If a page cooperates, then it can share data with another site
    - e.g. make an iframe and use postMessage to communicate
- What about for arbitrary (e.g. non-HTML) resources?
    - e.g. an API server that returns the current date as JSON:

        { "date": 1570552348157 }

#### Problem: How to access data from client?
- Ideally, **site-a.com** could write this code:

const res = await fetch('https://site-b.com/api/date')
const data = await res.body.json()
console.log(data)
- Need some way for site to specify that response is allowed to be read
    - Ideally, HTTP response could specify an HTTP header indicating that reading this data is allowed

### Use <script> for cross-origin communication?
- Goal: site-a.com wants to read data from a cooperating site-b.com
- What if we requested data using a <script> tag?
    - <script> is not subject to the Same Origin Policy
- Remember: Cannot read data from a cross-origin script!
    - But, the contents will be treated as JavaScript and executed

a Naive Idea is to 
Add a script to site-a.com:

```javascript
<script src='https://site-b.com/api/date'></script>
```

Response from site-b.com/api/date:

{ "date": 1570552348157 }

### JSON with Padding (JSONP)

Add a script to site-a.com:

```javascript
<script>
    function handleTime (data) {
        console.log('got the date', data.date)  
    }
</script>
<scriptsrc='https://site-b.com/api/date?callback=handleTime'></script>
```
Response from site-b.com/api/date?callback=handleTime:

handleTime({ "date": 1570552348157 })

### Downsides of JSONP
- From site-a.com's perspective:
    - Need to write additional code to support cross-origin requests
    - Need to be careful: Some valid JSON strings are not legal JavaScript
    - Need to sanitize user-provided callback argument (see "reflected file download attack")
- From site-b.com's perspective:
    - Only want to get data from site-a.com, but need to give site-a.comthe ability to run arbitrary JavaScript – yikes!
