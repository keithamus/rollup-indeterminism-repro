#!/bin/sh
set -e
trap 'cat dist/rollup.log >&2' ERR

rm -rf dist/
mkdir -p dist/
run=0
while true; do
  run=$((run+1))
  RUN=${run} ./node_modules/.bin/rollup -c rollup.conf.js &>dist/rollup.log
  count=$(ls dist/index-*.js | wc -l)
  if [ $count -gt 1 ]; then
    printf 'F\n'
    ls -t dist/*.js | xargs diff -U1
    echo "After $run runs"
    exit 1
  else
    printf '.'
  fi
done
