#! /bin/bash

# Fetch a version of the IG publisher jar from its remote storage location
# Get the version from the tools.json file

set -eo pipefail

EXTRACT_VERSION=$(cat tools.json | jq -r '.publisher.version' | cut -d 'v' -f 2)
VERSION=${1:-$EXTRACT_VERSION}

echo "Fetching IG Publisher version $VERSION"

JAR_LOCATION="https://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots&g=org.hl7.fhir.publisher&a=org.hl7.fhir.publisher.cli&v=$VERSION&e=jar"
wget --output-document=org.hl7.fhir.publisher.jar "$JAR_LOCATION"
