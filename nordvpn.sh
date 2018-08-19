#!/usr/bin/env bash

set -euo pipefail

if [ $# -gt 1 ]; then
  country=$1
else
  country=dk
fi

ovpn_dir=~/.vpn/ovpn_tcp

server=$(ls "${ovpn_dir}/${country}"* | shuf | tail -1)

printf "Connecting to %s\n" "$(basename ${server})"

username="$(pass nordvpn.com-username)"
password="$(pass nordvpn.com)"

exec sudo expect -f - <<EOF
spawn openvpn "${server}"
expect "*?Username:*"
send -- "${username}"
send -- "\n"
expect "*?Password:*"
send -- "${password}"
send -- "\n"
expect eof
EOF
