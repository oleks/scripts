#!/usr/bin/env bash

# Convert any video supported by ffmpeg to mp3. The resulting mp3 will be saved
# in the same location as the original video, and will have the same filename,
# except the filename extension. This script assume that the given filepath has
# an adequate filename extension.

# Copyright 2017 oleks <oleks@oleks.info>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. A copy of the License
# text is included alongside this file as LICENSE.md.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.

set -euo pipefail

path=$1

ffmpeg -i "${path}" -vn -c:a libmp3lame "${path%.*}.mp3"
