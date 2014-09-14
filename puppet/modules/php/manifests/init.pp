class php {

  # Install the php5-fpm and php5-cli packages
  package { ['php5-fpm',
             'php5-cli']:
    ensure => present,
    require => Exec['apt-get update'],
  }

  # Make sure php5-fpm is running
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }

  # Add any additional packages 
  package { [ 'php5-gd']:
    ensure => installed,
  }
  
  # Allow for a custom php.ini
  file { "/etc/php.ini":
    source => "puppet:///modules/php/files/php.ini",
  }

}
