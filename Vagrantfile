Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "codius-vm"
  config.vm.define "codius-vm"

  config.vm.synced_folder "src", "/home/vagrant/src"
  config.vm.network "forwarded_port", guest: 3010, host: 3010
  config.vm.network "forwarded_port", guest: 7770, host: 7770

   config.vm.provider "virtualbox" do |vb|
  # OSX workaround - disable microphone access
     vb.customize ["modifyvm", :id, "--audio", "none"]
     vb.memory = 2048
   end

   config.vm.provision "copy-files", type: "file", source: "res", destination: "$HOME/res"

   config.vm.provision "bootstrap", type: "shell", path: "res/bootstrap.sh"
  
   config.vm.provision "hyperd", type: "shell", path: "res/install-hyperd.sh"

   config.vm.provision "codiusd", type: "shell", path: "res/install-codiusd.sh"

   config.vm.provision "moneyd", type: "shell", path: "res/install-moneyd.sh"

end
