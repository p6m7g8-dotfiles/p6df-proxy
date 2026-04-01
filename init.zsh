# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::proxy::deps()
#
#>
######################################################################
p6df::modules::proxy::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: str str = p6df::modules::proxy::prompt::context()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_NL
#>
######################################################################
p6df::modules::proxy::prompt::context() {

  local str
  local pair
  for pair in $(p6_env_list | p6_filter_row_select _PROXY=); do
    if p6_string_blank "$str"; then
      str="proxy:\t  $pair"
    else
      str=$(p6_string_append "$str" "proxy:\t  $pair" "$P6_NL")
    fi
  done

  p6_return_str "$str"
}
