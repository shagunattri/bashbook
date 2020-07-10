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


