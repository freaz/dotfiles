#!/bin/sh

while read LINE; do
  code --install-extension "$LINE"
done < $(dirname $0)/extensions.list

