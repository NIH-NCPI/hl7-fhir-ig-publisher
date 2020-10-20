#! /bin/bash

# Fetch a version of the IG publisher jar from its official repository
# Usage ./scripts/fetch_publisher_jar.sh [ a-specific-version ]

set -eo pipefail

echo "✔ Begin fetching ..."

VERSION=${1:-'latest'}

# Parse semantic versioning if given in a 'v\d+.\d+.\d+-SNAPSHOT' format
if [ $VERSION != 'latest' ]
then
    VERSION=$(echo "$VERSION" | cut -d 'v' -f 2 | cut -d '-' -f 1)
# Or, convert version to semantic versioning when 'latest'
else
    VERSION=$(curl "https://api.github.com/repos/hl7/fhir-ig-publisher/releases/$VERSION" | jq -r .tag_name) 
fi

echo "Fetching IG Publisher version $VERSION"

DOWNLOAD_URL="https://github.com/HL7/fhir-ig-publisher/releases/download/$VERSION/publisher.jar"

echo "Downloading publisher JAR from $DOWNLOAD_URL"

curl -L $DOWNLOAD_URL -o publisher.jar

echo "✅ Finished fetching!"
