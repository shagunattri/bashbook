### Docker Architecture

One of the main parts of the docker ecosystem is the socker engine.

### Docker engine 

Consists of:

Docker CLI <===> API <===> Docker Daemon


It has an underlying client server architecture that communicates through a REST API.

Thus the client the docker CLI talks to the docker daemon using the API

Docker CLI is easy with using built,run,ps and other commands.


You can have other clients working with the daemon apart form the CLI,you can build your own client or use  a web interface to manage/control the objects.

Thus the docker engine API can be levereged to build complex operations like:
- Automated schedules operations
- use docker sdks for python or go and write programs to do with the cli and perform operations
- docker client can talk with more than daemon

The docker daemon does a lot of things:
- managing docker objects
- responding to client requests
- etc. and doing all the work in the server.

Server is a daemon ps and listens for api requests and is responsible for creating and managing containers
,images,n/w's and other docker objects.


docker engine is the the system as a whole

docker is a set of tools where

`dockerd` is the docker daemon responsible for the many coool stuff offered by docker does a lot of tasks.


It does:
- container management

    Managing the container lifecycle
- image management

    Pulling images from registries and managing them locally
- storage management

    Metadtata storage.


It does all this without client intervention.

It also talks to other components that do low level work i.e,
`containerd`
`runc` responsible for container low level management.

docker daemon also has a **Plugin architecture** and gives docker an extemsible nature.
where features not provided by docker can be added on as a plugin

Also has other componenets for logging networking etc,and this is a community edition.

The enterprise edition comes with a lot more features. 
- deployement 
- orchestration
- registry management

### Registry

Registry is a storage/content delivery system acting as a hub for the docker images.
Every dockerhost has a local registry where it keeps the images,metadata and manages them.

Managing custom registeries is done via the docker registery command available in docker enterprise edition.

Docker pull and push are used to manage registeries and images and can also make private registeries in the 
docker hub.


```bash 
docker pull node
```


***Dockerfile***
```bash
FROM node:alpine

COPY index.js .

CMD ["node","index.js"]
```

```bash
docker run --network host super-server
```
