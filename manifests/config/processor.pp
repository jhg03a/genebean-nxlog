# allow for custom porcessor blocks
#
# Example Puppet Code:
# ::nxlog::config::processor { 'tranformer':
#   processor_module  => 'pm_transformer',
#   processor_input_format    => 'syslog_rfc3164',
#   processor_output_format   => 'csv',
#   processor_csv_output_fields => [
#     '$facility',
#     '$severity',
#     '$timestamp',
#     '$hostname',
#     '$application',
#     '$pid',
#     '$message',
#   ],
# }
#
# Resulting output:
#
define nxlog::config::processor (
  $conf_dir                    = $::nxlog::conf_dir,
  $conf_file                   = $::nxlog::conf_file,
  $order_processor             = $::nxlog::order_output,
  $processor_options           = $::nxlog::processor_options,
  ) {

  concat::fragment { "processor_${name}":
    target  => "${conf_dir}/${conf_file}",
    order   => $order_processor,
    content => template($processor_template),
  }
}
