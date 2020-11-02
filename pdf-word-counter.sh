#! /bin/bash
# set -ex

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

FILE=$1
MAX=${2:-100}

pdftotext $FILE - | sed "s/[^A-Za-z]/ /g" | tr '[:upper:]' '[:lower:]' | tr '[:space:]' '[\n*]' | awk 'length($0)>=3' | grep -v "^\s*$" | sort | uniq -c | sort -bnr | head -$MAX

