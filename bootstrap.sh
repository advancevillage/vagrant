#!/bin/bash

#更新系统软件源
apt_source=mirrors.aliyun.com

(
cat << EOF
deb http://$apt_source/ubuntu/ xenial main restricted universe multiverse
deb http://$apt_source/ubuntu/ xenial-security main restricted universe multiverse
deb http://$apt_source/ubuntu/ xenial-updates main restricted universe multiverse
deb http://$apt_source/ubuntu/ xenial-backports main restricted universe multiverse

deb-src http://$apt_source/ubuntu/ xenial main restricted universe multiverse
deb-src http://$apt_source/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://$apt_source/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://$apt_source/ubuntu/ xenial-backports main restricted universe multiverse

EOF
) > /etc/apt/sources.list

#添加docker的软件源
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
(
cat << EOF
deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
# deb-src [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
EOF
) > /etc/apt/sources.list.d/docker.list

#创建应用用户/组 cuger
webuser=cuger
webpasswd=richardkelly
sudo groupadd $webuser
sudo useradd -c $webuser -d /home/$webuser -g $webuser -s /bin/bash  $webuser
echo $webuser:$webpasswd | sudo chpasswd
sudo bash -c "echo \"$webuser ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/$webuser"

if [ ! -d /home/$webuser ]; then
    sudo mkdir -p /home/$webuser
    sudo chown -R $webuser:$webuser /home/$webuser
fi

#修改系统时区时间 Asia/Shanghai
sudo timedatectl set-timezone Asia/Shanghai

#修改hostname
sudo hostnamectl set-hostname localhost

#修改系统终端显示颜色配置
(
cat << EOF
PS1="\[\033[01;32m\]\u\[\033[01;36m\]@\[\033[01;34m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\] \[\033[01;36m\]\t\[\033[0m\] \[\033[01;31m\]#\[\033[0m\] \[\033[01;37m\]"
EOF
) >> /root/.bashrc

(
cat << EOF
PS1="\[\033[01;32m\]\u\[\033[01;36m\]@\[\033[01;34m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\] \[\033[01;36m\]\t\[\033[0m\] \[\033[01;31m\]\\$\[\033[0m\] \[\033[01;37m\]"
EOF
) >> /home/vagrant/.bashrc

#基础软件vim, tmux, git, git-flow, 
sudo apt-get -y install vim
sudo apt-get -y install tmux
sudo apt-get -y install git
sudo apt-get -y install git-flow
sudo apt-get -y install nmon
sudo apt-get -y install aptitude

(
cat << EOF
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set number
set ruler
set mouse=a
set nocompatible
set novisualbell
set cmdheight=2
set backspace=indent,eol,start
set syntax=on
set t_Co=256
set syntax=enable
set cul
set cuc
set go=
set background=dark
set showmode
set magic
set history=500
set report=0
set clipboard=unnamed
set viminfo+=!
set nobackup
set noswapfile
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set iskeyword+=_,@,$,%,#,-
set whichwrap+=<,>,h,l
set autoindent
set showmatch
EOF
) >> /etc/vim/vimrc

#设置同步文件夹
if [ ! -d /opt/web ]; then
    sudo mkdir -p /opt/web
    sudo chown -R $webuser:$webuser /opt/web
else
    sudo chown -R $webuser:$webuser /opt/web
fi