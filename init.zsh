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
# Function: p6df::modules:::proxy::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules:::proxy::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::proxy::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_NL
#>
######################################################################
p6df::modules::proxy::prompt::mod() {

  local str
  local pair
  for pair in $(p6_env_list | grep _PROXY=); do
    if p6_string_blank "$str"; then
      str="proxy:\t  $pair"
    else
      str=$(p6_string_append "$str" "proxy:\t  $pair" "$P6_NL")
    fi
  done

  p6_return_str "$str"
}
