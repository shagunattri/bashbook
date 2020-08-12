```bash
sudo docker run -t ubuntu bash 
# run a clean empty instance of ubuntu
```

`docker run -p 8000:8000 -it ctfd/ctfd ## CTFd.io`

```bash
# theharvester
git clone https://github.com/laramies/theHarvester 
cd theHarvester
docker build -t theharvester .
docker run theharvester -h 
```

### Docker and postgres

```bash
systemctl start docker

docker run --name pg -p 5432:5432 postgres 
#postgres instance

docker run -e PGADMIN_DEFAULT_EMAIL="shagun" -e PGADMIN_DEFAULT_PASSWORD="password" -p 5555:80 --name pgadmin dpage/pgadmin4

docker exec -it pg bash 
#run bash in container

//self signed
openssl req -x509 -newkey rsa:4096 -nodes -sha256 -subj '/CN=localhost' -keyout private.pem -out cert.pem

//permissions
chmod 600 key.pem
chown postgres key.pem

//pgadmin
docker run -e PGADMIN_DEFAULT_EMAIL=“hussein” -e PGADMIN_DEFAULT_PASSWORD=“password” -p 5555:80 —name pgadmin dpage/pgadmin4 
```

