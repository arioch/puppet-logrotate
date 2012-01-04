# Class: logrotate::config
#
#
class logrotate::config {
  file { $logrotate::params::confdir:
    owner   => root,
    group   => root,
    ensure  => directory,
    require => Class['logrotate::install'],
  }
}
