### Web Security - HTML,JS


>Goal #1 -> The Attacker mindset 

Think about security,architectural systems and integrations

>Goal #2 -> The Defender mindset

It is always hard to defend as we need a comprehensive understanding of the structure and technologies and ways to counter-attack.

Always **disclose responsibly**

### Why is security hard?
- Lot of buggy code and some edge cases that might trigger a bug.
- Involves Social Engineering
- There is always a marketplace for vulns and profit to be made

### Vulnerability vs Exploit ?
- Weaponising vulns makes up for a exploit
- Finding a flaw is a vulnerability and using the vulnerability to is exploit which is used to exploit the bug be it takeover the system for cryptomining,botnet....etc.

#### Attacking a computer system and exploiting it allows for:
- Spam
- DOS
- Infecting visitors with malware
- Data Theft
- Mine Crypto
- Ransomware
- Political motivation

### Web Security 101

Protect the user
- from SE attacks
- from trackers,private data being leaked

- Browser Security
     - **Same origin policy** is an integral part of making browsing secure.

    - Server App Security- You dont control the client and have to make sure your server is not exploitable also don't want the attacker to be able to run arbitrary HTTP clients.

    - Client app security- Prevent users from being attacked while using the app locally


**Always try to Audit code & research before using it.**

Attack vectors for websites are many and making them secure is:
- A extremely ambitious goal
- Involves same tab mashups
- Require low level features and often hardware access
- A desire for high performance
- APIs weren't designed from the first principles as the purpose of web has evolved
- Web always requires a strict compatibility requirements and 

**Don't break the web**

The web is tangled together with new models always coming up and making the **web - "a mess"**.


Browsers do a lot of tasks that involves inputs from the user such as:

- Download content from anywhere
- spawn worker ps
- Open sockets to a server or even to another user's browser
- Display media in a huge number of formats
- Run custom code on the GPU
- Save/Read from the fs.


### Visions for the web

The web has a lot of goals to fulfill where it is visioned

- To use it as a simple document viewer
- Or as a powerful web application framework

and both visions have Pros/Cons..

#### But the Web is robust

and to secure the web you need to **learn to architect secure systems.**

>HTML
- tags - img,video,audio,canvas,link,style,script
- context

#### Include CSS in a page
```HTML
<!-- External CSS file -->
<linkrel='stylesheet' href='/path/to/styles.css' />

<!-- Inline CSS -->
<style>  
    body {
        color: hot-pink;  
        }
</style>
```

### Include JS in a Page

```JS
<!-- External JS file -->
<script src='/path/to/script.js'></script>

<!-- Inline JS -->
<script>
    window.alert('hi there!')
</script>
```

JS is:
- Fun
- Flexible
- Immediate feedback
- Dev env is preinstalled,easy to start

Node.js
- Js on the CLI
- Adds built in fns for fs,HTTP,DNS and sockets
- Modules systems,binary data support

Browser provides additional JS API's that came from:
- JS language spec
- DOM
- Nodejs built-ins

Egs:
- Array
- document.createElement
- fs.readFile

Rusty browser APIs
- window.open()
- window.moveTo()
- window.resizeTo()


>URL Contains 

**scheme -> Hostname -> Path -> Query -> Fragment**

Query is a dynamic part of the url including the fragment

Fragment is labelled part of the document to jump to the part of the document

To specipy a URL you can use:
- Full URL
- Relative URL
- Absolute URL
- Fragment URL

```HTML
Full URL: <a href='http://stanford.edu/news/2019/'>2019 News</a>

Relative URL: a href='september'>September News</a>

    Same as http://stanford.edu/news/2019/september

Absolute URL: a href='/events'>Events</a>

    Same as http://stanford.edu/events

Fragment URL: a href='#section3'>Jump to Section 3</a>
        
        Scrolls to <a name='section3' /> within page
        
        Same as http://stanford.edu/events#section3
```

### Further Reading
https://developers.google.com/web/updates/2018/09/inside-browser-part1

https://developers.google.com/web/updates/2018/09/inside-browser-part2

https://developers.google.com/web/updates/2018/09/inside-browser-part3

https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript
