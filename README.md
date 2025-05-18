# xml-parser

This XML-parser will be an introduction to rust together with databases. We try to implement everything that is required in this repo and goal is to have a working development environment ready with running a one small script.

### Goal of the project

- Everything will be run on top of WSL2, no external machines.
- Deployment should be fully automated.
- All source code will be here.
- Password will be handled with care, nothing is stored on the version control.

<h1> Test cases </h1>
- Test cases to be done later, XML parsing and storing to database.

## Rust - Container
### Building
```
docker build -t rust-dev .
```
### Starting up
```
docker-compose up --build
docker-compose run --rm rust
UID=$(id -u) GID=$(id -g) docker-compose up -d
```
### Shutting down
```
TBA
```
### Operating
```
container=$(docker ps | grep rust | awk '{ print $1 }'); docker exec -it $container bash
```

## Postgres
#### Starting up
```
bash postgres/install.sh
```
#### Shutting down
```
bash postgres/stop.sh
```

#### Setup that this is being tested
- Docker version 20.10.24+dfsg1, build 297e128
- PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
- WSL version: 2.4.13.0
- Kernel version: 5.15.167.4-1
- WSLg version: 1.0.65
- MSRDC version: 1.2.5716
- Direct3D version: 1.611.1-81528511
- DXCore version: 10.0.26100.1-240331-1435.ge-release
- Windows version: 10.0.26100.3775

