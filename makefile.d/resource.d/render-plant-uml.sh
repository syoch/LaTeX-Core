#!/bin/bash
puml_file=$1
dest=$2

cat $puml_file \
  | curl --silent --show-error --fail \
      -H "Content-Type: text/plain; charset=UTF-8" \
      --data-binary @- http://localhost:8080/png --output -