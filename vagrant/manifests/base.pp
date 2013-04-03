class base {

  group { 'puppet':
    ensure => present
  }

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    timeout => 0
  } ->

  package { ['vim', 'git']:
    ensure => present
  }

}