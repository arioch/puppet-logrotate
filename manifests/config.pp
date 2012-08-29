# Class: logrotate::config
#
#
class logrotate::config {
  file { $logrotate::params::confdir:
    ensure  => directory,
    owner   => root,
    group   => root,
    require => Class['logrotate::install'],
  }
}
