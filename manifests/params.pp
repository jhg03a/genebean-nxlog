# Default settings for parameters
class nxlog::params {
  $conf_dir                    = undef
  $conf_file                   = undef
  $ensure_setting              = latest
  $ext_module                  = undef
  $ext_options                 = undef
  $input_options               = []
  $nxlog_root                  = undef
  $global_options              = undef
  $output_options              = undef
  $package_name                = $::kernel ? {
    'Linux'   => 'nxlog-ce',
    'Windows' => 'nxlog',
    default   => 'nxlog',
  }
  $processor_options           = undef
  $route_options               = undef

  # Ordering for the config fragments
  $order_header                = '01'
  $order_global                = '03'
  $order_extension             = '05'
  $order_input                 = '10'
  $order_processor             = '30'
  $order_output                = '40'
  $order_route                 = '90'
}
