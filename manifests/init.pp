# Class: tattle
#
# This module manages tattle
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class tattle ($dbhost = 'localhost',
              $dbname = 'tattle',
              $dbuser = 'tattle',
              $dbpass = 'tattle',
              $psource = 'GRAPHITE',
              $whisperdir = '/var/lib/carbon/whisper',
              $graphiteurl = 'http://localhost:8000/',
              $gangliaurl  = 'http://localhost:8000/ganglia2'
)
{

  package {'tattle':
    ensure => present;
  }

  file { '/etc/httpd/conf.d/tattle.conf':
    ensure => 'file',
    group  => '0',
    mode   => '0644',
    owner  => '0',
    source => 'puppet:///modules/tattle/tattle.conf',
  }

  file { '/var/vhosts/tattle/html/tmp':
    ensure => 'directory',
    group  => '0',
    mode   => '0777',
    owner  => '0',
  }

  file { '/var/vhosts/tattle/html/inc/config.php':
    ensure   => 'file',
    group    => '0',
    mode     => '0664',
    owner    => '0',
    content  => template('tattle/config.php.erb')
  }

}
