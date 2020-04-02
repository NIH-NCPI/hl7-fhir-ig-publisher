#!/bin/bash

# Entrypoint script for the Dockerized IG publisher
# JAVA_OPTS env variable should be a string containing valid JVM options
# to pass to the java program

set -eo pipefail

echo "Running publisher with JAVA_OPTS=$JAVA_OPTS"

if [[ -z "$JAVA_OPTS" ]];
then
    java -jar "/app/org.hl7.fhir.publisher.jar" "$@"
else
    java $(echo $JAVA_OPTS) -jar "/app/org.hl7.fhir.publisher.jar" "$@"
fi
