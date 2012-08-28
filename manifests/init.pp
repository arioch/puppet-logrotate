class logrotate () {
  # motd::register{'logrotate': }

  class { 'logrotate::params': }
  class { 'logrotate::install': }
  class { 'logrotate::config': }

  Class['logrotate::params'] ->
  Class['logrotate::install'] ->
  Class['logrotate::config']
}