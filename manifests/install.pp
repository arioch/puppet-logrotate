# Class: logrotate::install
#
#
class logrotate::install {
  package { $logrotate::params::pkg:
    ensure => installed,
    require => Class['logrotate::params'],
  }
}
