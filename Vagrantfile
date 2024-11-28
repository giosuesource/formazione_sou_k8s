Vagrant.configure("2") do |config|
  config.vm.box = "rockylinux/9"
  config.vm.box_version = "4.0.0"
  config.vm.provider "virtualbox"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 50000, host: 50000
  config.vm.define "macchina" do |macchina|
    macchina.vm.hostname = "macchina"
 #   nodo1.vm.network "private_network", ip: "192.168.56.2"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end



end


