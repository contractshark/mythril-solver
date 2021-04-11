#!/bin/bash

files=$(find . -name '*.sol' -type f)

for i in $files; do
    echo "scanning file $i"
    myth -x --solc-args '--allow-paths .' "$i" 
    if ! myth; then
        exit 1
        echo "the result was $?"
    fi
done
