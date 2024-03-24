# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::proxy::util::off()
#
#>
######################################################################
p6df::modules::proxy::util::off() {

  local ev
  for ev in $(p6_env_list | p6_filter_select "proxy=" "insensitive"); do
    local e=$(p6_echo $ev | p6_filter_pluck_column "1" "=")
    p6_echo $e
    unset $e
  done

  p6_return_void
}
