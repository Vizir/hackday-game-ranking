class webapp_rails {

  package { ['ruby1.9.3', 'libmysqlclient-dev', 'nodejs']:
    ensure  => present,
    require => Exec['apt-get upgrade']
  } ->

  exec { 'install rails':
    command => '/usr/bin/gem install rails',
    timeout => 0,
    logoutput => true
  } ->

  exec { 'bundle install':
    command => '/usr/local/bin/bundle install --path=/home/vagrant',
    cwd => '/project',
    logoutput => true,
    user => 'vagrant',
    timeout => 0
  } ->

  file { 'database.yml':
    path => '/project/config/database.yml',
    source => '/vagrant/files/database.yml'
  } ->

  exec { 'rake db':
    path => '/usr/bin:/usr/local/bin',
    unless => 'mysql -u root hackday-game-ranking_development',
    command => 'bundle exec rake db:create:all && bundle exec rake db:migrate && bundle exec rake db:seed',
    cwd => '/project',
    logoutput => true,
    user => 'vagrant',
    require => Service['mysql']
  } ->

  exec { 'rails server':
    path => '/usr/bin:/usr/local/bin',
    command => 'nohup bundle exec rails s > /dev/null 2>&1 &',
    cwd => '/project',
    logoutput => true,
    user => 'vagrant'
  }

}