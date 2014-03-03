Exec { path => ["/home/vagrant/.rbenv/bin/", "/home/vagrant/.rbenv/shims/", "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

rbenv::install { "vagrant": group => 'vagrant'}
rbenv::compile { "2.0.0-p0": user => "vagrant", global => true}

class { 'postgresql::globals':
  encoding => 'UTF8',
  locale   => 'en_NG',
}->
class { 'postgresql::server':
  encoding => 'UTF8',
  listen_addresses => '*',
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users => '0.0.0.0/0',
  postgres_password => 'postgres',
}
postgresql::server::db { 'kandan_production':
  encoding => 'UTF8',
  user => 'postgres',
  password => 'postgres',
}
package { 'libpq-dev': }

package { 'libsqlite3-dev': }

exec{"bundle_install":
  command => "bundle install",
  timeout => 0,
  cwd => '/vagrant',
  require => [Rbenvgem["vagrant/2.0.0-p0/bundler/present"], Rbenv::Install["vagrant"], Class["postgresql::server"]]
}

exec{"create_kandan_db":
  command => 'bundle exec rake db:migrate kandan:bootstrap',
  cwd => '/vagrant',
  environment => 'RAILS_ENV=production',
  require => Exec['bundle_install']
}

exec{"start_kandan":
  command => 'bundle exec rails s -d',
  cwd => '/vagrant',
  environment => 'RAILS_ENV=production',
  require => Exec['create_kandan_db']
}