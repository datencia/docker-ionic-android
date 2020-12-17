FROM node:10.23.0-slim

LABEL maintainer="David Atencia <david.atencia@gmail.com>"

ENV IONIC_VERSION=6.12.3 \
    CORDOVA_VERSION=10.0.0 \
    ANDROID_HOME=/opt/android-sdk-linux \
    ANDROID_TOOLS_VERSION=r25.2.5 \
    ANDROID_API_LEVEL=android-27 \
    ANDROID_BUILD_TOOLS_VERSION=30.0.3

RUN echo "Installing basics" && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -qq update && \
    apt-get -qq install -y \
        git \
        wget \
        unzip \
        --no-install-recommends

RUN echo "Installing Gradle & Java JDK 8" && \
    apt-get -qq install -y \
        gradle \
        openjdk-8-jre \
        openjdk-8-jdk \
        --no-install-recommends

RUN echo "Installing Android SDK" && \
    mkdir -p /root/.android && \
    touch /root/.android/repositories.cfg && \
    mkdir -p ${ANDROID_HOME}/licenses && \
    echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > ${ANDROID_HOME}/licenses/android-sdk-license && \
    echo d56f5187479451eabf01fb78af6dfcb131a6481e >> ${ANDROID_HOME}/licenses/android-sdk-license && \
    echo 24333f8a63b6825ea9c5514f83c2829b004d1fee >> ${ANDROID_HOME}/licenses/android-sdk-license && \
    echo 84831b9409646a918e30573bab4c9c91346d8abd > ${ANDROID_HOME}/licenses/android-sdk-preview-license && \
    wget -O android-tools-sdk.zip -nv https://dl.google.com/android/repository/tools_${ANDROID_TOOLS_VERSION}-linux.zip && \
    unzip -q android-tools-sdk.zip -d ${ANDROID_HOME} && \
    rm -f android-tools-sdk.zip && \
    yes y | ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" "platform-tools" "platforms;${ANDROID_API_LEVEL}"

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

RUN echo "Installing Ionic & Cordova" && \
    npm i -g @ionic/cli@${IONIC_VERSION} cordova@${CORDOVA_VERSION} cordova-res --unsafe-perm && \
    ionic --no-interactive config set -g daemon.updates false && \
    cordova telemetry off

RUN echo "Cleaning up" && \
    npm cache clear --force && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean
