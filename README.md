# Puppet module: thin

This is a Puppet module for thin based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Javier Bértoli / Netmanagers

Official site: http://www.netmanagers.com.ar

Official git repository: http://github.com/netmanagers/puppet-thin

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install thin with default settings

        class { 'thin': }

* Install a specific version of thin package

        class { 'thin':
          version => '1.0.1',
        }

* Disable thin service.

        class { 'thin':
          disable => true
        }

* Remove thin package

        class { 'thin':
          absent => true
        }

* Enable auditing without without making changes on existing thin configuration *files*

        class { 'thin':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'thin':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'thin':
          source => [ "puppet:///modules/example42/thin/thin.conf-${hostname}" , "puppet:///modules/example42/thin/thin.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'thin':
          source_dir       => 'puppet:///modules/example42/thin/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'thin':
          template => 'example42/thin/thin.conf.erb',
        }

* Automatically include a custom subclass

        class { 'thin':
          my_class => 'example42::my_thin',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'thin':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'thin':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'thin':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'thin':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/netmanagers/puppet-thin.png?branch=master" alt="Build Status" />}[https://travis-ci.org/netmanagers/puppet-thin]
