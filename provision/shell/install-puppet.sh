#!/usr/bin/env bash



if [ ! -f /etc/apt/sources.list.d/puppetlabs.list ]; then
  wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
  sudo dpkg -i puppetlabs-release-trusty.deb
fi

if [ "X`/usr/bin/which puppet`" != 'X/usr/bin/puppet' ]; then
  sudo apt-get update
  sudo apt-get install puppet -y
fi

# Install some puppet modules
while read puppet_module; do
  install_like_module=`echo $puppet_module | sed -e 's/\//-/g'`
  if ! puppet module list | grep $install_like_module; then
    puppet module install $install_like_module
  fi
done<<HERE
puppetlabs-apt
garethr/docker
HERE

