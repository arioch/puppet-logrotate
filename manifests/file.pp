define logrotate::file (
  $source = "${logrotate::params::confdir}/${name}",
  $log,
  $options = [ 'weekly', 'compress', 'rotate 7', 'missingok' ],
  $prerotate = 'NONE',
  $postrotate = 'NONE'
) {
  file { "${logrotate::params::confdir}/${name}":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 644,
    content => template('logrotate/logrotate.erb'),
    require => Class['logrotate::config'],
  }
}
