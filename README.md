# Table of Contents

- [Introduction](#introduction)
- [Prerequisite](#prerequisite)
- [Installation](#installation)
- [Quick Start](#quick-start)

# Introduction

Dockerfile to build a LAMP container image.

#  Prerequisite

Of chourse install docker :

```bash
apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```

Edit apt-source list with your favorite editor.

If the file doesn’t exist, create it.

```bash
vim /etc/apt/sources.list.d/docker.list
```

And add this line for Debian Jessie. 

```bash
deb https://apt.dockerproject.org/repo debian-jessie main
```

Save it and close.

Update APT.

```bash
apt-get update
```

Install !

```bash
apt-get install docker-engine
```

# Installation

Build the image yourself.

```bash
docker build -t lockh/lamp github.com/lockh/docker-lamp
```

# Quick Start

Run the LAMP image

```bash
docker run --name lamp -d lockh/lamp:latest
```
