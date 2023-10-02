#!/bin/bash

mkdir -p ./screenshots
jq -r 'to_entries[] | .key + " " + .value' ./links.json | while read -r key url; do
    if [ -f "$key" ]; then
        echo "$key exists"
        continue
    fi
    curl -fsSL "$url" -o "./screenshots/$key"
    echo "* downloaded ./screenshots/$key"
done

# Note: use
# echo $(file screenshots/IMAGE_FILE_NAME | awk -F' ' '{print $2}' | tr '[:upper:]' '[:lower:]')
# to get the extension name
