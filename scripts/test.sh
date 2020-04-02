#! /bin/bash

# Integration test to make sure basic implementation guide publishing works

set -eo pipefail

echo "************** Start integration tests **************"

ig_site_dir=${1:-"$(pwd)/test/ig-site"}

# Check if user specified a location for ig site
if [[ -z $1 ]]; then
    echo "Using default location for implementation guide: $ig_site_dir"
else
    echo "Using user specified location for implementation guide: $ig_site_dir"
fi

# Run ig-publisher on test ig
docker run --rm -it \
    -e JAVA_OPTS="-Xmx1g -Xms256m" \
    -v "$ig_site_dir":/data \
    kidsfirstdrc/fhir-ig-publisher -ig "/data/ig.ini" -tx n/a

echo "************** End integration tests **************"
