#!/bin/sh

count=1
rm -rf dist/
while [ $count -eq 1 ]; do
  rollup -c rollup.conf.js
  ls dist/
  count=$(ls dist/index-*.js | wc -l)
  echo $count
  if [ $count -gt 1 ]; then
    exit $count
  fi
done
