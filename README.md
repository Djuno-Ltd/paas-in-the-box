# Djuno agent
![Image of Djuno Logo](https://djuno.io/wp-content/uploads/2020/06/cropped-Djuno-just-logo-1-transparent.png)

[![MIT Licensed](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE.md)
[![Build Status](https://travis-ci.com/Djuno-Ltd/awesome-compose.svg?branch=main)](https://travis-ci.com/Djuno-Ltd/awesome-compose)
# paas-in-the-box
docker swarm mode, PaaS Solution to Build, Deploy, Manage, and Scale Your Apps. Get Apps to Market Faster by Focusing on the Code and Not on Underlying Infrastructure.

### Interactive mode
User is prompted to setup application from command line.

Example:

```{r, engine='bash', count_lines}
docker run -it --rm \
  --name djuno-installer \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  djunoltd/install:edge
```

### Non-interactive mode
Setup is done based on environment variables passed to installer. 
Interactive mode must be set to 0 (disabled).

Example:

```{r, engine='bash', count_lines}
docker run -it --rm \
  --name djuno-installer \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  -e INTERACTIVE=0 \
  -e STACK_NAME=djuno \
  -e APP_PORT=888 \
  djunoltd/install:latest
```

