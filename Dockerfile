FROM jruby:9

WORKDIR /app

RUN apt-get update && \
    apt-get -y install ruby-full build-essential zlib1g-dev jq

RUN gem install bundler jekyll

RUN mkdir -p /root/.fhir/packages

COPY tools.json /app/

RUN wget --output-document=/app/org.hl7.fhir.publisher.jar "https://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots&g=org.hl7.fhir.publisher&a=org.hl7.fhir.publisher.cli&v=$(cat /app/tools.json | jq -r '.publisher.version' | cut -d 'v' -f 2)&e=jar"

ENTRYPOINT ["java", "-jar", "/app/org.hl7.fhir.publisher.jar"]
CMD ["/bin/bash", "-c", "echo Welcome to the FHIR IG Publisher"]
