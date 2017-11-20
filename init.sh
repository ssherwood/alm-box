#!/usr/bin/env bash

mkdir -p gogs keys teamcity/data teamcity/logs

ssh-keygen -t rsa -f ./keys/teamcity_agent -N ''
