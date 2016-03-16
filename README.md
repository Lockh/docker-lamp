# Table of Contents

- [Introduction](#introduction)
- [Contributing](#contributing)
- [Changelog](Changelog.md)
- [Reporting Issues](#reporting-issues)
- [Installation](#installation)
- [Quick Start](#quick-start)

# Introduction

Dockerfile to build a LAMP container image.


# Installation

Build the image yourself.

```bash
docker build -t lockh/mysql github.com/lockh/docker-lamp
```

# Quick Start

Run the mysql image

```bash
docker run --name mysql -d lockh/lamp:latest
```
