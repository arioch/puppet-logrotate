# Define: logrotate::file
#
#
define logrotate::file (
  $log,
  $source = "${logrotate::params::confdir}/${name}",
  $options = [ 'weekly', 'compress', 'rotate 7', 'missingok' ],
  $prerotate = 'NONE',
  $postrotate = 'NONE'
) {
  file { "${logrotate::params::confdir}/${name}":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('logrotate/logrotate.erb'),
    require => Class['logrotate::config'],
  }
}
