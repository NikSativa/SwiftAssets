#!/bin/bash

script_full_path=$(dirname "$0")
SWIFTGEN_PATH=$script_full_path/3rdparty/swiftgen

if [ "$(ls -A $SWIFTGEN_PATH)" ]
then
    exit
fi

mkdir -p $SWIFTGEN_PATH

SWIFTGEN_VERSION="6.2.1"
SWIFTGEN_URL="https://github.com/SwiftGen/SwiftGen/releases/download/${SWIFTGEN_VERSION}/swiftgen-${SWIFTGEN_VERSION}.zip"

TMP_DIR="tmp"

mkdir -p $TMP_DIR

cd $TMP_DIR && { curl -LO $SWIFTGEN_URL ; cd -; }

unzip "${TMP_DIR}/swiftgen-${SWIFTGEN_VERSION}" -d $SWIFTGEN_PATH

rm -rf $TMP_DIR
