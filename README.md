# 🔥🐳 Dockerized HL7 IG Publisher

<p align="center">
  <a href="https://github.com/fhir-sci/hl7-fhir-ig-publisher/blob/master/LICENSE"><img src="https://img.shields.io/github/license/fhir-sci/hl7-fhir-ig-publisher.svg?style=for-the-badge"></a>
  <a href="https://circleci.com/gh/fhir-sci/hl7-fhir-ig-publisher"><img src="https://img.shields.io/circleci/project/github/fhir-sci/hl7-fhir-ig-publisher.svg?style=for-the-badge"></a>
</p>

The purpose of this repo is to Dockerize the HL7 IG Publisher jar so that you can avoid installing dependencies and run the publisher in a Docker container.

This is very useful for running the IG Publisher in CI pipelines. You can see an example of this in the
[Kids First FHIR Model](https://github.com/kids-first/kf-model-fhir) repo.

**Note**
The Docker image is built from a released version of the IG Publisher jar. This used to come from the parent repo: https://github.com/FHIR/latest-ig-publisher, but this is no longer the case. Images are now built using releases from https://github.com/HL7/fhir-ig-publisher. The release version for which to build the image is set in the `version.json` file. 

## Docker Images

The [CircleCI pipeline](https://raw.githubusercontent.com/fhir-sci/latest-ig-publisher/master/.circleci/config.yml)
for this repo is setup so that merges into the `master` branch are only allowed if the IG Publisher jar is able to successfully build the sample IG in the [tests/ig-site](https://github.com/ncpi-fhir/hl7-fhir-ig-publisher/tree/master/test/ig-site) folder.

Upon successful merge into the `master` branch, the CI pipeline will push the Docker image for the IG publisher release to Docker Hub and tag it with the release version in `version.json`. 

You can fetch the images on Docker Hub here:
https://hub.docker.com/repository/docker/kidsfirstdrc/fhir-ig-publisher

## Example Use
Run the IG publisher in a docker container with a bind mounted volume containing
everything needed to build the IG:

```shell
# docker run --rm -it -v <path to IG dir>:<any dir in docker container> <docker image> <normal IG publisher CLI args here>
$ docker run --rm -it -v $(pwd)/test/ig-site:/data kidsfirstdrc/fhir-ig-publisher:latest -ig /data/ig.ini -tx n/a
```

## Downloading an IG Publisher Release for Local Use 

Anyone can use the download script to download a released IG Publisher jar 
for use on their local machine. 

```shell
# Fetch the release version 1.1.35
./scripts/fetch_publisher_jar.sh 1.1.35

# Fetch the latest release version
./scripts/fetch_publisher_jar.sh
```
