#!/bin/sh
set -e
trap 'cat dist/rollup.log >&2' ERR

rm -rf dist/
mkdir -p dist/
while true; do
  rollup -c rollup.conf.js &>dist/rollup.log
  printf '.'
  count=$(ls dist/*.js | wc -l)
  if [ $count -gt 1 ]; then
    printf '\n'
    ls -t dist/*.js | xargs diff -U1
    exit 1
  fi
done
