# allow for custom global config options
#
# Example Puppet Code:
# ::nxlog::config::global { 'logging':
#   global_options => [
#     'LogFile /var/log/myNXlogfile.log'
#  ]
# }
#

define nxlog::config::output (
  $conf_dir         = $::nxlog::conf_dir,
  $conf_file        = $::nxlog::conf_file,
  $order_global     = $::nxlog::order_global,
  $global_options   = $::nxlog::global_options,) {

  concat::fragment { "global_${name}":
    target  => "${conf_dir}/${conf_file}",
    order   => $order_global,
    content => template('nxlog/global.erb'),
  }
}
