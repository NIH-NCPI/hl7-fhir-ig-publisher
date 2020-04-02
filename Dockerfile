FROM jruby:9

WORKDIR /app

RUN apt-get update && \
    apt-get -y install ruby-full build-essential zlib1g-dev

RUN gem install bundler jekyll

RUN mkdir -p /root/.fhir/packages

COPY org.hl7.fhir.publisher.jar org.hl7.fhir.validator.jar ./scripts/entrypoint.sh /app/

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/bin/bash", "-c", "echo Welcome to the FHIR IG Publisher"]
