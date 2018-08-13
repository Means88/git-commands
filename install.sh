#!/bin/sh

COMMANDS=(
  "git-cb"
  "git-squash"
)
BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"
FORCE=false

if [ "$1" == "-f" ] || [ "$1" == "--force" ]; then
  FORCE=true
fi

for COMMAND in ${COMMANDS[@]}
do
  TARGET="/usr/local/bin/$COMMAND"
  ls "$TARGET" 1>/dev/null 2>&1
  if [ "$?" == 0 ] && [ $FORCE == true ]; then
    rm -f "$TARGET"
  fi
  ln -s "$BASEDIR/$COMMAND" "$TARGET"
done
