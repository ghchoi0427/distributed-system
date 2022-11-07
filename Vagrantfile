Vagrant.configure("2") do |config|
    if Vagrant.has_plugin? ("vagrant-vbguest")
      config.vbguest.auto_update = false
    end
  
    config.vm.box = "ubuntu/focal64" # ubuntu 20.04
  
    config.vm.provider "virtualbox" do |vb|
        vb.name = "vagrant-env"
        vb.cpus = 2
        vb.memory = 2048
    end
  
    config.vm.hostname = "vagrant-env"
  
    config.vm.synced_folder "./project", "/home/vagrant/project", owner:"vagrant", group:"vagrant"
  
    config.vm.provision :shell, :inline => "sed -i 's/\r//g' /home/vagrant/project/setup/pre-install.sh"
    config.vm.provision :shell, :inline => "/home/vagrant/project/setup/pre-install.sh"
  end
  