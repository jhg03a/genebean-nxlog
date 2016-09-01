# Default settings for parameters
class nxlog::params {
  $conf_dir                    = undef
  $conf_file                   = undef
  $ensure_setting              = latest
  $ext_module                  = undef
  $ext_options                 = undef
  $input_options               = []
  $nxlog_root                  = undef
  $output_options              = undef
  $package_name                = $::kernel ? {
    'Linux'   => 'nxlog-ce',
    'Windows' => 'nxlog',
    default   => 'nxlog',
  }
  $processor_module            = undef
  $processor_input_format      = undef
  $processor_output_format     = undef
  $processor_csv_output_fields = []
  $route_destination           = undef
  $route_source                = undef

  # Ordering for the config fragments
  $order_header                = '01'
  $order_extension             = '05'
  $order_input                 = '10'
  $order_processor             = '30'
  $order_output                = '40'
  $order_route                 = '90'
}
