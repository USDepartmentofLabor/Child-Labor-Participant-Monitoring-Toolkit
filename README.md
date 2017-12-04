# Direct Beneficiary Monitoring System Prototype (DOL-ILAB)

## Overview

The text of presentation layer in this project follows [i18n](http://guides.rubyonrails.org/i18n.html) as much as
possible. Locale files can be found under [/config/locales](./config/locales)

## Development Environment Setup

Note these instructions assume you have an account on gitdev with a SSH key uploaded.

1. Ensure you have the Powershell version 3.0 or later installer.
2. Download and Install [VirtualBox](www.virtualbox.org/wiki/Downloads)
3. Download and Install [Vagrant](vagrantup.com/downloads)
4. Start your console, and go to source code folder.
5. For the first time before running `vagrant`, install vagrant NSF support for Windows:
   `vagrant plugin install vagrant-winnfsd`
6. Start rails development environment in a virtual machine: `vagrant up` (might take some take for the first time)
7. To enter into the VM, use `vagrant ssh`
8. To stop the VM, use: `vagrant halt`


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


## Deployment (need to update)

Run `cap production deploy` to deploy new code to live server.

The default user:pass for the testing server is: `deployer:deploy`

## Reload Example Data

1. `bundle exec rake db:prepare`
2. `bundle exec rake db:load_project_data`
3. `bundle exec rake DBMS:load_example_data`
