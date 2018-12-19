#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

host_interpolation=(
  "\#{hostname}"
  "\#{username}"
  "\#{hostname_fg_color}"
  "\#{hostname_bg_color}"
  "\#{username_fg_color}"
  "\#{username_bg_color}"
)

host_commands=(
  "#($CURRENT_DIR/scripts/hostname.sh)"
  "#($CURRENT_DIR/scripts/username.sh)"
  "#($CURRENT_DIR/scripts/hostname_fg_color.sh)"
  "#($CURRENT_DIR/scripts/hostname_bg_color.sh)"
  "#($CURRENT_DIR/scripts/username_fg_color.sh)"
  "#($CURRENT_DIR/scripts/username_bg_color.sh)"
)

set_tmux_option() {
  local opion=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local all_interpolated="$1"
  for ((i=0; i<${#host_commands[@]}; i++)); do
    all_interpolated=${all_interpolated/${host_interpolation[$i]}/${host_commands[$i]}}
  done
  echo "$all_interpolated"
}

update_tmux_option() {
  local option=$1
  local option_value=$(get_tmux_option "$option")
  local new_option_value=$(do_interpolation "$option_value")
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
