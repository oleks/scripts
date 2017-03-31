#!/usr/bin/env bash

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

mountpoint=$1
mountpath=$2
zipfile=$3

fusermount -u "${mountpoint}" || true
jmtpfs "${mountpoint}"
trap "fusermount -u \"${mountpoint}\"" INT TERM EXIT

tmpdir="$(mktemp -d)/"
trap "rm -rf \"${tmpdir}\"" INT TERM EXIT

unzip "${zipfile}" -d "${tmpdir}"

targetpath="${mountpoint}/${mountpath}/"

mkdir -p "${targetpath}"
rsync -av "${tmpdir}/" "${targetpath}/"
