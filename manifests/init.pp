# Class: nxlog
#
# This module manages nxlog. See README.md for more details.
#
class nxlog (
  $conf_dir                    = $::nxlog::params::conf_dir,
  $conf_file                   = $::nxlog::params::conf_file,
  $ensure_setting              = $::nxlog::params::ensure_setting,
  $ext_module                  = $::nxlog::params::ext_module,
  $ext_options                 = $::nxlog::params::ext_options,
  $input_options               = $::nxlog::params::input_options,
  $nxlog_root                  = $::nxlog::params::nxlog_root,
  $order_extension             = $::nxlog::params::order_extension,
  $order_header                = $::nxlog::params::order_header,
  $order_input                 = $::nxlog::params::order_input,
  $order_output                = $::nxlog::params::order_output,
  $order_route                 = $::nxlog::params::order_route,
  $order_global                = $::nxlog::params::order_global,
  $global_options              = $::nxlog::params::global_options,
  $output_options              = $::nxlog::params::output_options,
  $package_name                = $::nxlog::params::package_name,
  $processor_options           = $::nxlog::params::processor_options,
  $route_options               = $::nxlog::params::route_options,
) inherits ::nxlog::params {
  if ($nxlog_root) {
    validate_absolute_path($nxlog_root)
  }
  validate_absolute_path($conf_dir)
  validate_string($conf_file)

  anchor { '::nxlog::start':
  } ->
  class { '::nxlog::install':
  } ->
  class { '::nxlog::config':
  } ->
  class { '::nxlog::service':
  } ->
  anchor { '::nxlog::end':
  }
}
