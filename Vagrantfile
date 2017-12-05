# -*- mode: ruby -*-
# vi: set ft=ruby :
#

$script = <<SCRIPT
curl -sL https://deb.nodesource.com/setup_8.x | sh
add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add -
apt-get update
apt-get upgrade -y
apt-get install -y git build-essential postgresql libpq-dev ruby libcurl3 \
  libruby ruby-dev nodejs vim tmux redis-server awscli heroku
gem install bundler
sudo -u postgres -- createuser -sU postgres ubuntu
SCRIPT

Vagrant.configure(2) do |config|
  # Use a simple, current Ubuntu box
  config.vm.box = "ubuntu/xenial64"

  # 3000 is the rails dev server, 3080 is for mailcatcher
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3080, host: 3080
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  # Use local ssh keypairs
  config.ssh.forward_agent = true

  # Customize VirtualBox VM
  config.vm.provider "virtualbox" do |v|
    v.name = "DBMS Development"
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.synced_folder "../shared", "/home/ubuntu/shared",
    id: "shared",
    owner: "ubuntu",
    group: "ubuntu",
    mount_options: ["dmode=775,fmode=664"]

  config.vm.synced_folder ".", "/home/ubuntu/dbms",
    id: "ubuntu-root",
    owner: "ubuntu",
    group: "ubuntu",
    mount_options: ["dmode=775,fmode=664"]

  config.vm.provision "shell", inline: $script
end
