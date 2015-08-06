# Puppet-logrotate

[![Build Status](https://travis-ci.org/arioch/puppet-logrotate.svg?branch=master)](https://travis-ci.org/arioch/puppet-logrotate)

## Basic usage

    node 'node1.domain.tld' {
      logrotate::file { 'apache2':
        postrotate => "/etc/init.d/apache2 reload > /dev/null",
        log        => [ '/var/log/apache2/access.log', '/var/log/apache2/error.log' ],
        options    => [ 
          'weekly',
          'compress',
          'rotate 52',
          'missingok'
        ],
      }
    }

## Unit testing

Plain RSpec:

    # rspec

Using bundle:

    # bundle exec rspec

Test against a specific Puppet or Facter version:

    # PUPPET_VERSION=2.7.1  bundle update && bundle exec rspec
    # PUPPET_VERSION=2.7.19 bundle update && bundle exec rspec
    # FACTER_VERSION=1.6.8  bundle update && bundle exec rspec

