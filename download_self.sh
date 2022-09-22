#!/bin/bash

script_full_path=$(dirname "$0")
SWIFTGEN_PATH=$script_full_path/3rdparty/SwiftAssets

if [ "$(ls -A $SWIFTGEN_PATH)" ]
then
    exit
fi

mkdir -p $SWIFTGEN_PATH

SWIFTGEN_VERSION="1.0.0"
SWIFTGEN_URL="https://github.com/NikSativa/SwiftAssets/releases/download/${SWIFTGEN_VERSION}/swiftassets-${SWIFTGEN_VERSION}.zip"

TMP_DIR="tmp"

mkdir -p $TMP_DIR

cd $TMP_DIR && { curl -LO $SWIFTGEN_URL ; cd -; }

unzip "${TMP_DIR}/swiftassets-${SWIFTGEN_VERSION}" -d $SWIFTGEN_PATH

rm -rf $TMP_DIR
