Vagrant::Config.run do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.share_folder "v-root", "/vagrant", "vagrant"
  config.vm.share_folder "v-project", "/project", "."  
  config.vm.network :hostonly, "192.168.33.10"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "vagrant/manifests"
    puppet.manifest_file  = "webapp.pp"
  end

end