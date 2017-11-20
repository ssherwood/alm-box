# ALM (in a) Box

This is a small example suite of ALM tools for doing CI/CD from a common git
based repository.  This suite is enabled by use of docker-compose to launch and
link the individual tools (and their required tooling).

## Why?

I am planning on using this for demo purposes and wanted a quick way to fire up
a complete suite of tools.  I opted for tooling that either had a small
footprint or other interesting characteristics to facilitate the demo.

## ALM Tooling

### [MailHog](https://github.com/mailhog/MailHog)

Simple web and API based SMTP server for local testing.

### [Gogs (Git)](https://gogs.io/)

Easy and lightweight UI for managing Git repositories.  It can be run on a
Raspberry Pi so it'll be perfect to run for a demo.

#### Additional Info

- https://github.com/gogits/gogs/tree/master/docker
- https://github.com/gogits/gogs/issues/3026
- https://github.com/gogits/go-gogs-client/wiki/Repositories

### [TeamCity (CI/CD)](https://www.jetbrains.com/teamcity/)

This can be run freely as long as it has less than 20 Build configurations
(jobs) and 3 Agents.  See [here](https://confluence.jetbrains.com/display/TCD10/Licensing+Policy) for more details.

### MatterMost

TODO

### Spring Initializr (Code): https://start.spring.io/

Simple starter apps based on Spring Boot.

## Setup

Run the ```init.sh``` script in the root directory to create the required
folders.  Then just run ```docker-compose up``` (sudo if needed).  To run in
the background, use the ```-d``` option.

Install the ssh keys to TeamCity (the private key) and the public key to Gogs.

## Add an entry in /etc/hosts

```properties
127.0.1.1   gogs
127.0.1.1   teamcity-server
```

This will let you interact with gogs locally just like the container-to-container will
