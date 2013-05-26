#!/bin/bash

ROOT=.
RESTORED_ROOT=$ROOT/restored
RESTORED_DIR=$RESTORED_ROOT/$2

mkdir $RESTORED_ROOT || echo "$RESTORED_ROOT directory exists."
mkdir $RESTORED_DIR || echo "$RESTORED_DIR directory exists."
tar xvzf $1 -C $RESTORED_DIR
echo "Backup restored: $RESTORED_DIR"
