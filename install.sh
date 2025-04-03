#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR=/usr/local/opt/pokemon_show
BIN_DIR=/usr/local/bin/

if [ ! -d $INSTALL_DIR ]; then
    mkdir $INSTALL_DIR
fi

chmod +x ./*.sh

ls --hide=${0:2} | egrep "\.(sh|py)" | xargs -I {} cp -v {} $INSTALL_DIR
ln -v -s $INSTALL_DIR/pokemon_show_and_wait.sh $BIN_DIR/pokemon_show_and_wait
ln -v -s $INSTALL_DIR/pokemon_show_nicely.sh $BIN_DIR/pokemon_show_nicely

echo "Installation succesful, you can delete the source files now"
echo "Don't forget to add a terminal profile called pokemon"
