exec { 'apt-get update':
  path => '/usr/bin',
}

file { '/var/www/':
  ensure => 'directory',
}

include settings, nginx, php, mysql, pear, drush