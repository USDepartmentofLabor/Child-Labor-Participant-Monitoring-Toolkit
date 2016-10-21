# Direct Beneficiary Monitoring System Prototype (DOL-ILAB)

## Overview

The text of presentation layer in this project follows [i18n](http://guides.rubyonrails.org/i18n.html) as much as
possible. Locale files can be found under [/config/locales](./config/locales)

## Development Environment

**Notice**: running application from shared folder (folder shared between Windows OS and Virtual OS) can be [very
slow](https://meta.discourse.org/t/vagrant-and-virtualbox-slow-on-windows-update/17176)! The **best solution** is: setup
and run rails in Windows (troublesome), or do the coding directly inside of Virtual Linux OS (inconvenient), or buy a
Mac :)

1. Download and Install [VirtualBox](www.virtualbox.org/wiki/Downloads)
2. Download and Install [Vagrant](vagrantup.com/downloads)
3. Start your console, and go to source code folder.
4. For the first time before running `vagrant`, install vagrant NSF support for Windows:
   `vagrant plugin install vagrant-winnfsd`
5. Start rails development environment in a virtual machine: `vagrant up` (might take some take for the first time)
6. To enter into the VM, use `vagrant ssh`
7. To stop the VM, use: `vagrant halt`


## Getting Started

1. Start VM: `vagrant up`
2. Enter into VM: `vagrant ssh`. If you can not ssh into VM, then you will want to get an SSH client, and use it to
   connect to your Vagrant VM instead. We recommend PuTTY: [PuTTY Download
   Link](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
3. `cd /vagrant`
4. `bundle exec rake db:setup`
5. Start the server: `bundle exec rails s -b 0.0.0.0`
6. Open up a web browser on your local workstation and navigate to [http://localhost:3000](http://localhost:3000)


## Load Example Data

You can load some example data to play with this system. To load the data:

  `bundle exec rake DBMS:load_example_data`


## Deployment

Run `cap production deploy` to deploy new code to live server.

The default user:pass for the testing server is: `deployer:deploy`

## Reload Example Data

1. `bundle exec rake db:reset`
2. `bundle exec rake DBMS:load_example_data`
