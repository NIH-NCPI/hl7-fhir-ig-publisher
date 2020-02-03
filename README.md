# 🔥🐳 Dockerized HL7 IG Publisher

This repository is a fork of https://github.com/FHIR/latest-ig-publisher.

Its main purpose is to Dockerize the HL7 IG Publisher so that you can
avoid installing dependencies and run the publisher in a Docker container.

This is very useful for running the IG Publisher in CI pipelines. You can
see an example of this in the
[Kids First FHIR Model](https://github.com/kids-first/kf-model-fhir) repo

## Docker Images
This repository is fairly regularly updated with any commits to the
[upstream](https://github.com/FHIR/latest-ig-publisher) repository.

The [CircleCI pipeline](https://raw.githubusercontent.com/fhir-sci/latest-ig-publisher/master/.circleci/config.yml)
for this repo is setup so that merges into the `master` branch are only allowed
if the IG Publisher is able to successfully build the sample IG in the
[tests/ig-site](https://github.com/fhir-sci/latest-ig-publisher/tree/master/test/ig-site)
folder.

Upon successful merge into the `master` branch, the CI pipeline will push
the Docker image for the IG publisher to Docker Hub and tag it with the
release version listed in the IG Publisher's version file
[tools.json](https://raw.githubusercontent.com/fhir-sci/latest-ig-publisher/master/tools.json)

You can fetch the images on Docker Hub here:
https://hub.docker.com/repository/docker/kidsfirstdrc/fhir-ig-publisher

## Example Use
Run the IG publisher in a docker container with a bind mounted volume containing
everything needed to build the IG

```shell
# docker run --rm -it -v <path to IG dir>:<any dir in docker container> <docker image> <normal IG publisher CLI args here>
$ docker run --rm -it -v $(pwd)/test/ig-site:/data kidsfirstdrc/fhir-ig-publisher:latest -ig /data/ig.ini -tx n/a
```
