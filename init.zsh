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
# Function: str str = p6df::modules::proxy::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_NL _PROXY
#>
######################################################################
p6df::modules::proxy::prompt::line() {

  local pair
  local str
  for pair in $(p6_env_list | p6_filter_select "_PROXY="); do
    if p6_string_blank "$str"; then
      str="proxy:\t  $pair"
    else
      str=$(p6_string_append "$str" "proxy:\t  $pair" "$P6_NL")
    fi
  done

  if ! p6_string_blank "$str"; then
    p6_return_str "$str"
  else
    p6_return_void
  fi
}

######################################################################
#<
#
# Function: p6df::modules::proxy::off()
#
#>
######################################################################
p6df::modules::proxy::off() {

  local ev
  for ev in $(p6_env_list | grep -i proxy=); do
    local e=$(p6_echo $ev | cut -f 1 -d =)
    p6_echo $e
    unset $e
  done

  p6_return_void
}
