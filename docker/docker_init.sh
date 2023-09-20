#!/usr/bin/env bash

WORK_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "current directory is {$WORK_PATH}"

docker pull pleaserun/rjy_slam_work:slamesh_18.04

docker run -it -d -p 5900:5900 -p 2222:22 -e RESOLUTION=1920x1080  \
            -v "$WORK_PATH"/datasets/:/root/datasets \
            -v "$HOME"/huiyan_ws/opensource/:/root/workspace/ \
            --name test_slamesh \
            pleaserun/rjy_slam_work:slamesh_18.04
