# ---- Use locally ------
FROM jruby:9 as base

WORKDIR /app

RUN apt-get update && \
    apt-get -y install ruby-full build-essential zlib1g-dev vim

RUN gem install bundler jekyll

COPY org.hl7.fhir.publisher.jar org.hl7.fhir.validator.jar /app/

ENTRYPOINT ["java", "-jar", "/app/org.hl7.fhir.publisher.jar"]s
CMD ["/bin/bash", "-c", "echo Welcome to the FHIR IG Publisher"]

# ---- Use in CircleCI pipeline ------
FROM base as circleci
RUN apt-get -y install git sudo openssh-client ca-certificates tar gzip
