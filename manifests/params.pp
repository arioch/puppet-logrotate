# Class logrotate::params
#
#
class logrotate::params {
  case $::operatingsystem {
    'debian', 'ubuntu': {
      $pkg     = 'logrotate'
      $confdir = '/etc/logrotate.d'
    }

    'RedHat', 'CentOS': {
      $pkg = ''
    }

    default: {
      fail 'Operating system not supported yet.'
    }
  }
}
