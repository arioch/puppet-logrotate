# Class: logrotate::install
#
#
class logrotate::install {
  package { $logrotate::params::pkg:
    ensure  => present,
    require => Class['logrotate::params'],
  }
}
