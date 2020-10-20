FROM jruby:9

WORKDIR /app

RUN apt-get update && \
    apt-get -y install ruby-full build-essential zlib1g-dev jq

RUN gem install bundler jekyll

RUN mkdir -p /root/.fhir/packages

COPY version.json scripts/fetch_publisher_jar.sh /app/

RUN ./fetch_publisher_jar.sh $(cat version.json | jq -r '.publisher.version')

ENTRYPOINT ["java", "-jar", "/app/publisher.jar"]
CMD ["/bin/bash", "-c", "echo Welcome to the FHIR IG Publisher"]
