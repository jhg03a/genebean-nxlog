# allow for custom input blocks
#
# Example Puppet Code:
# ::nxlog::config::input { 'sawyer':
#   output_module  => 'im_msvistalog',
#   input_execs    => [
#     'delete($Keywords)',
#     '$raw_event = to_json()',
#   ],
# }
#
# Resulting output:
#
define nxlog::config::input (
  $conf_dir     = $::nxlog::conf_dir,
  $conf_file    = $::nxlog::conf_file,
  $input_options  = $::nxlog::input_options,
  $order_input  = $::nxlog::order_input,) {
  concat::fragment { "input_${name}":
    target  => "${conf_dir}/${conf_file}",
    order   => $order_input,
    content => template('nxlog/input.erb'),
  }
}
