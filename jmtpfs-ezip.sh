#!/usr/bin/env bash

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

targetpath="${mountpoint}${mountpath}/"

mkdir -p "${targetpath}"
rsync -av "${tmpdir}/" "${targetpath}/"
