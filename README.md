# ALM (in a) Box

This is a small example suite of ALM tools for doing CI/CD from a common git
based repository.  This suite is enabled by use of docker-compose to launch and
link the individual tools (and their required tooling).

## Why?

I am planning on using this for demo purposes and wanted a quick way to fire up
a complete suite of tools.  I opted for tooling that either had a small
footprint or other interesting characteristics to facilitate the demo.

## ALM Tools

### [Gogs (Git)](https://gogs.io/)

Easy and lightweight UI for Git repositories.  It can be run on a Raspberry Pi
so it'll be perfect to run for a demo.

#### Additional Info

- https://github.com/gogits/gogs/tree/master/docker
- https://github.com/gogits/gogs/issues/3026
- https://github.com/gogits/go-gogs-client/wiki/Repositories

### [TeamCity (CI/CD)](https://www.jetbrains.com/teamcity/)


### MatterMost



#### Additional Info

- https://concourse.ci/docker-repository.html

### Spring Initializr (Code): https://start.spring.io/

Simple starter apps based on Spring Boot.

## Basic Flow

We will use Spring Initializr to generate code, create a repo in Gogs and check
it in.  We'll create a Pipeline in Concourse and then trigger the first build.

## TODO

### Setup MiniKube to Deploy to

## Setup

```sh
mkdir -p keys/web keys/worker

ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''

ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''

cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
cp ./keys/web/tsa_host_key.pub ./keys/worker

export CONCOURSE_EXTERNAL_URL=<your IP addr>

```

## Add an entry in /etc/hosts

```properties
127.0.0.1   gogs
127.0.0.1   teamcity-server
```

This will let you interact with gogs locally just like the container-to-container will
