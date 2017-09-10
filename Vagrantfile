# Vagrantfile的作用是描述工程需要的机器和如何配置和提供这些机器
# 总体分为3个部分：(1)虚拟机[VirtualBox]的配置 (2)SSH配置 (2)通过Vagrant指令配置一些基础配置
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # 基础Box配置
  config.vm.box = "centos/7"
  config.vm.box_url = "F:"
  config.vm.box_url += "/vagrant/box/centos-7-x86_64.virtualbox.box"
  
  config.ssh.username = "node"
  config.ssh.password = "passw0rd"
    
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false
  
  # 配置虚拟机的网络类型:  端口转发，公有网络，还有私有网络。
  # 端口转发  
  config.vm.network "forwarded_port", guest: 22, host: 2100, auto_correct: true
  config.vm.network "forwarded_port", guest: 80, host: 8100, host_ip: "127.0.0.1"    
  # 私有网络
  # config.vm.network "private_network", ip: "192.168.33.10"
  # 公有网络
  # config.vm.network "public_network"
  # 1) en1: Wi-Fi (AirPort)
  # 2) en0: 以太网 
  config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)", ip: "192.168.1.181"
    
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # 虚拟机[VirtualBox]配置
  config.vm.provider "virtualbox" do |vb|
     # 是否显示启动时的可视化窗口
     vb.gui = false
     # 虚拟机机器的名字
     vb.name = "kelly"
     # 内存大小
     vb.memory = "4096"
     # CPU
     vb.cpus = 2
  end
  
  # 配置初始化启动

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
