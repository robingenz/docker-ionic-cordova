FROM ubuntu:xenial

LABEL MAINTAINER="Robin Genz <mail@robingenz.dev>"

ARG JAVA_VERSION="8"
ARG NODEJS_VERSION="11"
ARG ANDROID_SDK_VERSION="4333796"
ARG ANDROID_BUILD_TOOLS_VERSION="28.0.3"
ARG IONIC_CLI_VERSION="5.2.4"
ARG CORDOVA_CLI_VERSION="8.1.2"

ENV ANDROID_HOME /opt/android-sdk

WORKDIR /tmp

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
    unzip \
    p7zip p7zip-full \
    python \
    openjdk-$JAVA_VERSION-jre \
    openjdk-$JAVA_VERSION-jdk \
    gradle \
    # install android sdk tools
    && curl -sL https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip -o sdk-tools-linux-${ANDROID_SDK_VERSION}.zip \
    && unzip sdk-tools-linux-${ANDROID_SDK_VERSION}.zip \
    && mkdir $ANDROID_HOME && mv tools $ANDROID_HOME \
    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses \
    && $ANDROID_HOME/tools/bin/sdkmanager "platform-tools" "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    # install nodejs
    && curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs \
    # install ionic and cordova
    && npm i -g --unsafe-perm ionic@${IONIC_VERSION} cordova@${CORDOVA_VERSION} \
    # clean up
    && apt-get clean -y \
    && rm -rf /tmp/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip

WORKDIR /workdir
