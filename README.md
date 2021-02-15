# docker-ionic-cordova

Docker image for building [Ionic](https://ionicframework.com/) apps with [Cordova](https://cordova.apache.org/).

## How to use this image

### Build image

Build from [GitHub](https://github.com/robingenz/docker-ionic-cordova):  
```
docker build -t robingenz/ionic-cordova github.com/robingenz/docker-ionic-cordova
```

Available build arguments:

- JAVA_VERSION
- NODEJS_VERSION
- ANDROID_SDK_VERSION
- ANDROID_BUILD_TOOLS_VERSION
- IONIC_CLI_VERSION
- CORDOVA_CLI_VERSION

### Run image

Run the docker image:  
```
docker run -it robingenz/ionic-cordova
```

## CI Configuration

### GitLab

Here is a sample `.gitlab-ci.yml` file:

```yml
image: robingenz/ionic-cordova

stages:
    - build

build_android:
    stage: build
    cache:
        paths:
            - node_modules/
            - plugins/
    script:
        - npm ci
        - ionic cordova build android
    artifacts:
        paths:
            - platforms/android/app/build/outputs/apk/debug
```

## Questions / Issues

If you got any questions or problems using the image, please visit my [GitHub Repository](https://github.com/robingenz/docker-ionic-cordova) and write an issue.
