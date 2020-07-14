### The Docker Ecosystem

One of the key differences,we know is that virtualization is different from containerization.

Docker uses `container feature of linux systems` to provide logistical solutions for building,shipping and running software.


Apart from this docker has  a set of tools 
- Docker CLI  
- API interface and more tools 
- Docker Daemon

they work together for more enhanced experience.

### Contaniers

They are working instance of particular env called an image.

Containers are installed and use the user namespace with different tools,dependencies and configurations added to it.

```bash
docker images mongo* # look for images with mongo

docker run -d --name  denoContainer mongo # run mongo docker container
```
Containers are created from images.

Docker images are made with a dockerfile that create a frozen version for a certain environment along with it's own versioning and is defined with its structure,components,etc...

To make an image and run it using

```bash 
docker build -t my-docker-image .
```

Image is a blue print of a certain type of a container and serve as a template from which images are created.

Images define :
- linux flavor
- env variables
- packages
- custom files 
- etc...


Steps in dockerfile are called layers.


To make an image...

```vim
# dockerfile

FROM  alpine:3.11

RUN apk update
RUN apk add git vim less grep nmap

CMD ["echo","Installation Complete!"]
```

```bash
docker build -t myimage:1.0 .

docker images my*

# create and run containers
docker run -it --name simage myimage:1.0 sh
```
