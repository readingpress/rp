class php {

  # Install the php5-fpm and php5-cli packages
  package { 'php5-fpm':
    ensure => present,
    require => Exec['apt-get update'],
  }

  # Make sure php5-fpm is running
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }

  # Add any additional packages 
  package { [ 'php5-gd',
              'php5-mysql']:
    ensure => installed,
  }

  # Reload php
  exec { "reload-php-fpm":
    command => "/etc/init.d/php5-fpm reload",
    require => Service["php5-fpm"],
  }

}
