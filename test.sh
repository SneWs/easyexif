#!/bin/bash

DEMONAME=./Build/bin/demo

if [ ! -e ./Build/bin/demo ]; then
  # check if demo.exe exists, needed on windows
  if [ -e ./Build/bin/demo.exe ]; then
    DEMONAME=./Build/bin/demo.exe
  else
    echo Cannot find executable.
    exit 1
  fi
fi

for jpeg in `ls test-images/*.jpg`; do
  $DEMONAME $jpeg > /tmp/`basename $jpeg`.actual
  diff $jpeg.expected /tmp/`basename $jpeg`.actual > /tmp/diff.out
  if [[ -s /tmp/diff.out ]] ; then
    echo "FAILED ON $jpeg"
    cat /tmp/diff.out
    exit
  fi ;
  echo "PASS $jpeg"
done
