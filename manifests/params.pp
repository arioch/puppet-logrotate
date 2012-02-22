# Class logrotate::params
#
#
class logrotate::params {
  case $::operatingsystem {
    'debian', 'ubuntu', 'RedHat', 'CentOS', 'Fedora': {
      $pkg     = 'logrotate'
      $confdir = '/etc/logrotate.d'
    }

    default: {
      fail 'Operating system not supported yet.'
    }
  }
}
