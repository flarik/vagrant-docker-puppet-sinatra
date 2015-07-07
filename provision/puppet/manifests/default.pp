class { 'docker':
  manage_kernel => false,
}

docker::run { 'db01':
  image   => 'kabisa/postgres',
  env     => ['POSTGRES_PASSWORD=123test'],
  volumes => ["/opt/postgresql/data:/var/lib/postgresql/data"]
}

docker::run { 'web01':
  image   => 'kabisa/phusion-passenger',
  volumes => ["/opt/app:/home/app/webapp"],
  depends => [ 'db01' ],
  links   => ["db01:postgres"], # the alias 'postgres' gets exported to env with POSTGRES_ and is used in postgresql-env.conf 
  ports   => [ '80:80' ],
}

docker::exec { 'web01-bundle':
  container => 'web01',
  command   => 'su -l app -c "cd /home/app/webapp && bundle install && touch tmp/restart.txt"',
  tty       => true,
  require   => Docker::Run['web01']
}
