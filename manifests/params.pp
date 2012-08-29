# Class logrotate::params
#
#
class logrotate::params {
  case $::operatingsystem {
    'Debian', 'Ubuntu', 'RedHat', 'CentOS', 'Fedora', 'Scientific', 'OEL': {
      $pkg     = 'logrotate'
      $confdir = '/etc/logrotate.d'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}
