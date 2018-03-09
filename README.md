[![Build Status](https://travis-ci.org/datencia/docker-ionic-android.svg?branch=master)](https://travis-ci.org/datencia/docker-ionic-android) [![](https://images.microbadger.com/badges/image/datencia/ionic-android.svg)](https://microbadger.com/images/datencia/ionic-android) [![](https://images.microbadger.com/badges/version/datencia/ionic-android.svg)](https://microbadger.com/images/datencia/ionic-android)

# Docker image for Ionic projects to get CI/CD

> based on [datencia/ionic](https://hub.docker.com/r/datencia/ionic/)

## Inspired by

- https://github.com/beevelop/docker-ionic
- https://github.com/marcoturi/ionic-docker
- https://github.com/agileek/docker

## Features

- Node 6
- Npm 5.6.0
- Yarn 1.3.2
- Ionic 3.19.1
- Cordova 8.0.0
- Java JDK 8
- Gradle 4.5.1
- Android SDK and build tools
  - APIs: android-23, android-24, android-25, android-26
  - Build-Tools: 27.0.3
- Google Chrome Headless for unit tests
- xvfb for e2e tests (Cypress & TestCafé)

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
