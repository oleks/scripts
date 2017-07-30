#!/usr/bin/env bash

set -euo pipefail

path=$1

ffmpeg -i "${path}" -vn -c:a libmp3lame "${path%.*}.mp3"
