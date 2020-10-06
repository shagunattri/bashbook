- GET request. Make a GET request to the web server with path /ctf/get

`curl -X GET http://10.10.211.67:8081/ctf/get`

- POST request. Make a POST request with the body "flag_please" to /ctf/post

`curl -X POST http://10.10.211.67:8081/ctf/post -d "flag_please"`

- Get a cookie. Make a GET request to /ctf/getcookie and check the cookie the server gives you

`curl -X GET http://10.10.211.67:8081/ctf/getcookie -c cookies.txt `

- Set a cookie. Set a cookie with name "flagpls" and value "flagpls" in your devtools and make a GET request to /ctf/sendcookie

`curl -X GET http://10.10.211.67:8081/ctf/sendcookie --cookie flagpls=flagpls`
