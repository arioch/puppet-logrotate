## Basic usage

    node 'node1.domain.tld' {
      logrotate::file { 'apache2':
      postrotate => "/etc/init.d/apache2 reload > /dev/null",
      log        => [ '/var/log/apache2/access.log', '/var/log/apache2/error.log' ],
      options    => 
        [ 
          'weekly',
          'compress',
          'rotate 52',
          'missingok'
        ]
      }
    }
