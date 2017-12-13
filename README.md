# Direct Beneficiary Monitoring System Prototype (DOL-ILAB)

## Overview

The text of presentation layer in this project follows
[i18n](http://guides.rubyonrails.org/i18n.html) as much as possible. Locale
files can be found under [/config/locales](./config/locales)

## Development Environment Setup

Note these instructions assume you have an account on gitdev with a SSH key uploaded.
**Notice**: running application from shared folder (folder shared between
Windows OS and Virtual OS) can be [very
slow](https://meta.discourse.org/t/vagrant-and-virtualbox-slow-on-windows-update/17176)!
The **best solution** is: setup and run rails in Windows (troublesome), or do
the coding directly inside of Virtual Linux OS (inconvenient), or buy a Mac :)

1. Download and Install [VirtualBox](www.virtualbox.org/wiki/Downloads)
2. Download and Install [Vagrant](vagrantup.com/downloads)
3. Start your console, and go to source code folder.
4. For the first time before running `vagrant`, install vagrant NSF support for
   Windows: `vagrant plugin install vagrant-winnfsd`
5. Start rails development environment in a virtual machine: `vagrant up`
   (might take some take for the first time)
6. To enter into the VM, use `vagrant ssh`
7. To stop the VM, use: `vagrant halt`

## Getting Started

1. Start VM: `vagrant up`
2. Enter into VM: `vagrant ssh`. If you can not ssh into VM, then you will want
   to get an SSH client, and use it to connect to your Vagrant VM instead. We
   recommend
[PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).

After logging in to the VM, from the shell:

```shell
$ cd /dbms
$ bundle exec rake db:prepare
$ foreman
```

Then open up a web browser on your local workstation and navigate to
[http://localhost:3000](http://localhost:3000). The default login information
is: admin@ilabtoolkit.com / password.

## Load Example Data

From the VM shell:

```shell
$ bundle exec rake db:load_project_data
```

Note that you can also modify the `load_project_data` task in
lib/tasks/load_data.rake to load your project data or other example data if you
wish.

## Reload Example Data

From the VM shell:

```shell
$ bundle exec rake db:prepare db:load_project_data
```
