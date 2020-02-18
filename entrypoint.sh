#!/usr/bin/env bash

set -e

TEST_FILE=/chown_test/owner.dat

ls -l "$TEST_FILE"

FILE_USER=$(stat -c '%U' "$TEST_FILE")
FILE_GROUP=$(stat -c '%G' "$TEST_FILE"); \

if [ "$FILE_USER" != 'user' -o "$FILE_GROUP" != 'group' ]; then
  echo "ERROR: User:Group is not right - $FILE_USER:$FILE_GROUP"
  exit 1
else
  echo "Everything is OK!"
fi
