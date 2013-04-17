# Class: thin::params
#
# This class defines default parameters used by the main module class thin
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to thin class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class thin::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'thin',
  }

  $service = $::operatingsystem ? {
    default => 'thin',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'thin',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'thin',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/thin',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/thin/thin.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/thin',
    default                   => '/etc/sysconfig/thin',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/thin.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/thin',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/thin',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/thin/thin.log',
  }

  $port = '80'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
