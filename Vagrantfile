# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder "vagrant", "/vagrant"
  config.vm.synced_folder ".", "/project"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "vagrant/manifests"
     puppet.manifest_file  = "webapp.pp"
  end

end