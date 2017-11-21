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

### Run the ```init.sh``` script in the root directory to create the required folders

### Add thgit@github.com:ssherwood/alm-box.gite following entries in /etc/hosts

```properties
127.0.1.1   gogs
127.0.1.1   teamcity-server
```

You may need to add these to your noproxy configurations (if you are )

### Run ```docker-compose up``` (sudo if needed).  To run in the background, use the ```-d``` option

You may need to get the latest version of docker and docker-compose installed.  See here:

- https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
- https://git@github.com:ssherwood/alm-box.gitdocs.docker.com/compose/install/#install-compose

### Initialize Gogs

- Select the SQLite3 option
- Replace "localhost" with "gogs" on the Domain and Application URL
- Email Service Settings
  - mailhog:1025
  - gogs@s1pkicdemo.com
- Server and Other Services Settings
  - [x] Enable Mail Notifications
  - [ ] Enable Federated Avatars Lookup
  - [ ] Enable Captcha
- Select OK
- Log in and create the admin account via "Sign up now"
- Add the public ssh key generated for TeamCity in the ./keys folder

### Install the ssh keys to TeamCity (the private key) and the public key to Gogs

- Click Proceed
- Select HSQLDB (local database)
- Accept License and disable anonoymous stats
- Create the Admin account
  - teamcity
  - TeamCity
  - teamcity@s1pkicdemo.com
  - [x] Show date/time in my timezone
  - [x] Add builds triggered by me to favorites
- Go to Administration -> Email Notifier
  - mailhog
  - 1025
  - Test Connection
- Add the Agent
  - Select Agents -> Unauthorized (there should be 1)
  - Select the Agent named ```almbox_teamcity-agent_1```
  - Click "Authorize Agent"
- Setup the ssh keys
  - Select the _Root build job
  - Select "SSH Keys" on the left-hand menu
  - Pick Upload SSH Keys and upload the file from ./keys (the private key)
