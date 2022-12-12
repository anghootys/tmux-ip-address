#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

ip_address="$($CURRENT_DIR/scripts/ip_address.sh)"
ip_address_interpolation_string="\#{ip_address}"
ip_address_refresh_cmd_key="$(get_tmux_option "@ip_address_refresh_key" "A")"

do_interpolation() {
  local string="$1"
  local interpolated="${string/$ip_address_interpolation_string/$ip_address}"
  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  tmux bind-key "$ip_address_refresh_cmd_key" run-shell -b "$CURRENT_DIR/scripts/update_ip_address.sh"
  update_tmux_option "status-right"
}
main
