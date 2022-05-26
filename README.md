![Image of Djuno Logo](logo.svg)

[![MIT Licensed](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE.md)
[![Build Status](https://travis-ci.com/Djuno-Ltd/paas-in-the-box.svg?branch=main)](https://travis-ci.com/Djuno-Ltd/paas-in-the-box)
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

