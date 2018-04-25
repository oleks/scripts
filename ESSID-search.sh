#!/usr/bin/env bash

set -euo pipefail

interface=wlp2s0

iwlist "$interface" scan | \
  grep SSID | \
  perl -pe 's/^\s+ESSID:"(.*)"$/\1/' | \
  sort | uniq
