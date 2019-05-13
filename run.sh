#!/bin/bash

HUNTER_DOWNLOAD_SERVER=${PWD}/_Downloads/
HALF_DIR=${HUNTER_DOWNLOAD_SERVER}/bc445fc2b91c7a2c4ea0025012068ecab18ef36d/bc445fc
HALF_FILENAME=${HALF_DIR}/v1.1.0-p1.tar.gz
EMPTY_DIR=${PWD}/_Empty
mkdir -p ${HALF_DIR}
mkdir -p ${EMPTY_DIR}
wget https://github.com/hunter-packages/half/archive/v1.1.0-p1.tar.gz -O ${HALF_FILENAME}

polly_opts=(
    --toolchain gcc
    --config-all Release
    --verbose
    --clear
)

SERVER_GOOD="HUNTER_DOWNLOAD_SERVER=file://${HUNTER_DOWNLOAD_SERVER}"
SERVER_FAIL="HUNTER_DOWNLOAD_SERVER=file://${EMPTY_DIR}"

polly.py ${polly_opts[@]} --fwd URL_FIX=OFF                  --clear | tee should_work_fix_off.txt
polly.py ${polly_opts[@]} --fwd URL_FIX=OFF "${SERVER_FAIL}" --clear | tee should_fail_fix_off.txt
polly.py ${polly_opts[@]} --fwd URL_FIX=ON  "${SERVER_GOOD}" --clear | tee should_work_fix_on.txt
polly.py ${polly_opts[@]} --fwd URL_FIX=ON  "${SERVER_FAIL}" --clear | tee should_fail_fix_on.txt

# Note: grep -e "new URL" should*.txt only shows up with URL_FIX=ON
# see manual hunter_download_server_url in cmake/Hunter/config.cmake.y
