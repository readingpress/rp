class mysql {

  include mysql::params

  # Install mysql
  package { ['mysql-server']:
    ensure => present,
    require => Exec['apt-get update'],
  }

  # Run mysql
  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  # Use a custom mysql configuration file
  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysql'],
  }

  # We set the root password here
  exec { 'add-mysql-password':
    command => "mysqladmin -uroot password $mysql::params::password",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }

  exec { "setup-$mysql::params::dbname-db":
    command => "mysqladmin -uroot -p$mysql::params::password create $mysql::params::dbname",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'],
  }

}
