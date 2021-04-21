# WeltN24 Frontend CI Docker Image

## Description
This Docker image is maintained by WeltN24 GmbH Developers and its main purpose is the CI build of our Frontend Project Funkotron.

## Installed Tools
- aws
- git
- pip
- chrome
- node
- npm
- yarn

## How to test locally?
- Make changes in Dockerfile
- Run following command in the folder where the Dockerfile is located
- `docker build .`
- You can add debug outputs temporary at the end of the Dockerfile, e.g. `RUN node -v`

## How to release a new Version?
- This Dockerfile is automatically built and released on [Docker Hub](https://hub.docker.com/r/springmedia/rbbt-fnk-docker-node-chrome-headless/)
- Builds are triggered by released tags on github
- Login to Docker Hub is done via personalized accounts, which have to be connected to [r/springmedia](https://hub.docker.com/u/springmedia/)

## How to install a specific version of node?
1. Find your desired version here: [https://deb.nodesource.com/node_14.x/pool/main/n/nodejs/](https://deb.nodesource.com/node_14.x/pool/main/n/nodejs/)
1. Replace .deb url in Dockerfile

## Changelog
- **2021-04-21**: `Chrome 90`, `node 14.16.1`, `yarn 1.22.5`
- **2019-11-18**: `Chrome 78`, `node 12.13.0`, `yarn 1.19.1`
- **2019-05-08**: `Chrome 74`, `node 10.15.3`, `yarn 1.15.2`
- **2018-10-01**: `Chrome 69`, `node 10.9`, `yarn 1.10.1`
- **2018-06-28**: `Chrome 67`, `node 10.5`, `yarn 1.7.0`
- **2018-05-24**: `Rerelease of last version after move to github spring-media org and new docker hub orga`
- **2018-05-02**: `Chrome 66`, `node 10.0`, `yarn 1.6.0`
- **2018-03-16**: `Chrome 65`, `node 9.8`, `yarn 1.5.1`
- **2018-02-02**: `Chrome 64`, `node 9.5`
