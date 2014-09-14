class mysql {

  include settings

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
    command => "mysqladmin -uroot password $settings::mysql_root_password",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }

  exec { "setup-$settings::db_name-db":
    command => "mysqladmin -uroot -p$settings::mysql_root_password create $settings::db_name",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'],
  }

}
