exec { 'apt-get update':
  path => '/usr/bin',
}

file { '/var/www/':
  ensure => 'directory',
}

include nginx, php, mysql, pear, drush