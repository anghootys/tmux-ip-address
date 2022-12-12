#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

ip_address="$($CURRENT_DIR/ip_address.sh)"

do_interpolation() {
  local string="$1"
  local ip_addr=$ip_address
  if [ -z "$ip_address" ]
  then
    ip_addr="Offline"
  fi

  local interpolated="$(echo $1 | sed "s/\x07.*\x07/\x07$ip_addr\x07/g")"

  echo $interpolated
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
}
main
