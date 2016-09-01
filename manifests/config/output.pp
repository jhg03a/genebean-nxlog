# allow for custom output blocks
#
# Example Puppet Code:
# ::nxlog::config::output { 'sawyer':
#   output_address => 'logserver.example.com',
#   output_module  => 'om_udp',
#   output_port    => '6371',
# }
#
# ::nxlog::config::output { 'local':
#   output_file_path => 'C:/local.log',
#   output_module    => 'om_file',
# }
#
# Resulting output:
#
define nxlog::config::output (
  $conf_dir         = $::nxlog::conf_dir,
  $conf_file        = $::nxlog::conf_file,
  $output_options   = $::nxlog::output_options) {

  concat::fragment { "output_${name}":
    target  => "${conf_dir}/${conf_file}",
    order   => $order_output,
    content => template('nxlog/output.erb'),
  }
}
