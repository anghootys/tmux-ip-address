#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_ip_address() {
  local ip_address=$(curl --max-time 1.5 --silent http://ip.me)
  echo ${ip_address}
}

main() {
  print_ip_address
}

main
