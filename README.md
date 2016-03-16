# Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Quick Start](#quick-start)

# Introduction

Dockerfile to build a LAMP container image.


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
