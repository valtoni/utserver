#!/bin/bash
# https://wiki.unrealadmin.org/Unreal_Tournament

if [ "$1" == "" ]; then
    echo "Inform base dir server name"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "Inform server name"
    exit 1
fi

PACK_DIR=$1/unrealserver
NEW_UTDIR=$1/$2
NEW_UTDIR_SERVER="$NEW_UTDIR/ut-server"
NEW_UTDIR_SYSTEM="$NEW_UTDIR_SERVER/System"
sudo mkdir -p $NEW_UTDIR
sudo chown vscode:vscode $NEW_UTDIR
tar -zxf $PACK_DIR/ut-server-436.tar.gz -C $NEW_UTDIR
tar xfj  $PACK_DIR/UTPGPatch451LINUX.tar.tar -C $NEW_UTDIR
tar -zxf $PACK_DIR/asu-0.6.tar.gz -C $NEW_UTDIR
chmod +x "$NEW_UTDIR/asu.sh"
chmod +x "$NEW_UTDIR_SERVER/ucc"
ln -s $NEW_UTDIR_SYSTEM/libSDL-1.1.so.0 $NEW_UTDIR_SYSTEM/libSDL-1.2.so.0
export UT_DATA_PATH="$NEW_UTDIR_SYSTEM"
sudo chown vscode:vscode $NEW_UTDIR
