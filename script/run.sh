#!/bin/sh
set -e
trap 'cat dist/rollup.log >&2' ERR

rm -rf dist/
mkdir -p dist/
while true; do
  rollup -c rollup.conf.js &>dist/rollup.log
  count=$(ls dist/*.js | wc -l)
  if [ $count -gt 1 ]; then
    printf 'F\n'
    ls -t dist/*.js | xargs diff -U1
    exit 1
  else
    printf '.'
  fi
done
