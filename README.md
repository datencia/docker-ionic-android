[![Build Status](https://travis-ci.org/datencia/docker-ionic-android.svg?branch=master)](https://travis-ci.org/datencia/docker-ionic-android) [![](https://images.microbadger.com/badges/image/datencia/ionic-android.svg)](https://microbadger.com/images/datencia/ionic-android) [![](https://images.microbadger.com/badges/version/datencia/ionic-android.svg)](https://microbadger.com/images/datencia/ionic-android)

# Docker image for Ionic projects to get CI/CD

> based on [node:12.22.7-slim](https://hub.docker.com/_/node)

## Inspired by

- https://github.com/beevelop/docker-ionic
- https://github.com/marcoturi/ionic-docker
- https://github.com/agileek/docker

## Features

- Node 12.22.7
- Ionic 6.18.0
- Cordova 10.0.0
- Java JDK 8
- Android SDK and build tools
  - APIs: android-27
  - Build-Tools: 30.0.3
- APKTool 2.5.0

## Usage

### Pull from Docker Hub

```bash
docker pull datencia/ionic-android:latest
```

### Build from Dockerfile

```bash
docker build -t datencia/ionic-android .
```

### Build from GitHub

```bash
docker build -t datencia/ionic-android github.com/datencia/docker-ionic-android
```

### Run image

```bash
docker run -it datencia/ionic-android bash
```

### Use as base image

```Dockerfile
FROM datencia/ionic-android:latest
```
