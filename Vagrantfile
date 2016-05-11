# -*- mode: ruby -*-
# vi: set ft=ruby :
#

$script = <<SCRIPT
curl -sL https://deb.nodesource.com/setup_4.x | sh
apt-get upgrade -y
apt-get install -y git build-essential postgresql libpq-dev ruby libruby ruby-dev nodejs vim
gem install bundle
sudo -u postgres -- createuser -sU postgres vagrant
SCRIPT

Vagrant.configure(2) do |config|
  # Use a simple, current Ubuntu box
  config.vm.box = "cargomedia/ubuntu-1504-plain"

  # 3000 is the rails dev server, 3080 is for mailcatcher
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3080, host: 3080

  # Use local ssh keypairs
  config.ssh.forward_agent = true

  # Customize VirtualBox VM
  config.vm.provider "virtualbox" do |v|
    v.name = "DBMS Development"
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision "shell", inline: $script

end
