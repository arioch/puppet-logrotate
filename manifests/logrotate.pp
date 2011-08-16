class logrotate {
	define file (
			$source, 
			$log, 
			$options = [ 'weekly', 'compress', 'rotate 7', 'missingok' ], 
			$prerotate = 'NONE', 
			$postrotate = 'NONE'
	) {
	   	file { "/etc/logrotate.d/${name}":
			ensure  => present,
	    	owner   => root,
	        group   => root,
	        mode    => 644,
	        content => template('logrotate/logrotate.erb'),
	        require => Class['config'],
		}
	}
	
	class install {
		package { 'logrotate':
			ensure => installed,
		}
	}
	
	class config {
		file { '/etc/logrotate.d/':
	    	owner  	=> root,
	        group  	=> root,
			ensure 	=> directory,
			require	=> Class['install'],
	    }
	}
	
	class service {
		# ...
	}
	
	include install
	include config
	include service
}
