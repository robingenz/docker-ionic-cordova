# docker-ionic-cordova

Docker image for building Ionic apps with Cordova.

## How to use this image

### Pull image

Pull from GitHub Container Registry:  
`docker pull robinge/ionic-cordova:latest`

### Build image

Or build from GitHub:  
`docker build -t robinge/ionic-cordova github.com/robingenz/docker-ionic-cordova`

Available build arguments:

-   JAVA_VERSION
-   NODEJS_VERSION
-   ANDROID_SDK_VERSION
-   ANDROID_BUILD_TOOLS_VERSION
-   IONIC_CLI_VERSION
-   CORDOVA_CLI_VERSION

### Run image

Run the docker image:  
`docker run -it robinge/ionic-cordova`

## CI Configuration

### Gitlab

Here is a sample .gitlab-ci.yml file:

```
image: robinge/ionic-cordova:latest

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
