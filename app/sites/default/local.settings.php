<?php
/**
 *	@file
 *	Local Specific Settings. Use this to override defaults for local dev.
 */

$databases['default']['default'] = array(
	'driver' => 'mysql',
	'database' => 'rp',
	'username' => 'root',
	'password' => 'root', 
	'host' => '127.0.0.1',
	'prefix' => '',
	'collation' => 'utf8_general_ci',
);