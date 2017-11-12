# ALM (in a) Box

This is a small example suite of ALM tools for doing CI/CD from a common git
based repository.  This suite is enabled by use of docker-compose to launch and
link the individual tools (and their required tooling).

## Why?

I am planning on using this for demo purposes and wanted a quick way to fire up
a complete suite of tools.  I opted for tooling that either had a small
footprint or other interesting characteristics to facilitate the demo.

## ALM Tools

### Gogs (Git): https://gogs.io/

Easy and lightweight UI for Git repositories.  It can be run on a Raspberry Pi
so it'll be perfect to run for a demo.

#### Additional Info
- https://github.com/gogits/gogs/tree/master/docker
- https://github.com/gogits/gogs/issues/3026
- https://github.com/gogits/go-gogs-client/wiki/Repositories

### ConcourseCI (CI/CD): https://concourse.ci/

Concourse has an nice code-based CI/CD pipeline approach.  We should be able to
link it to the Gogs instance and demo from `git push` to CI/CD build.

#### Additional Info 
- https://concourse.ci/docker-repository.html

### Spring Initializr (Code): https://start.spring.io/

Simple starter apps based on Spring Boot.

## Basic Flow

We will use Spring Initializr to generate code, create a repo in Gogs and check
it in.  We'll create a Pipeline in Concourse and then trigger the first build.

## TODO

### Setup MiniKube to Deploy to

