
`Docker` is used to package software that can run on any hardware


Three important terminologies:
- Dockerfile
	- blueprint to build docker image
- Image
	- is a template to run a container
- Container
	- is a running ps(node)

solve problems by reproducing envs using the Dockerfile

where images can upload to the registery and can be accessed to run the container using the image.

`K8s/swarm` are used to scale and manage container for a infinte workload.

All the commands in the dockerfile represents layers of the image and commands are in shell/exec form
where shell form spaws a shell ps but the exec form doesn't.It take array args as input.

```bash
docker build -t shagun/nodeapp:1.0 . 
#build image with shagun as username and nodeapp as image name in version 1.0 in the current dir.
#you push image to docker registry or the cloud and run locally using the id and run container ps

docker push

#-p flag to enable port forwarding
```

Map port in the local machine to the port exposed in the docker machine and run on the local port specified.

To share data across multiple containers for that we can use volumes where it is shared folder that can be remounted.

It is a dedicated folder on the host machine 

The container can then create files and remount it into future containers or multiple of them using `docker volume`

```bash
docker volume create shared-stuff

docker run --mount source=shared-stuff,target=/stuff
#multiple container mounting the volume
```

Debugging using docker desktop and the logs to analyze the container.

You can write microservices and use docker compose.

Ideally you should run 1 process per container 

```bash
docker compose #used to run multiple docker containers at the same time

#we need a volume and and need to access a db we can do this by using docker-compose.yml

docker-compose up
#to find and run container all together

docker-compose down 
#to shut down the containers together.
```

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

