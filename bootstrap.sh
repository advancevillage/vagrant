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
sudo groupadd cuger
sudo useradd -c cuger -d /home/cuger -g cuger -s /sbin/nologin  cuger

#修改系统时区时间 Asia/Shanghai
sudo timedatectl set-timezone Asia/Shanghai

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

(
cat << EOF
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gbk,gck2312,gb18030
set number
set ruler
set mouse=a
set nocompatible
set novisualbell
set cmdheight=2
set wildmenu
set backspace=indent,eol,start
set syntax=on
set t_Co=256
set syntax=enable
set shortmess=atI
set cul
set cuc
set go=
set background=dark
set showmode
set magic
set history=500
set report=0
filetype on
filetype plugin on
set confirm
set clipboard=unnamed
filetype indent on
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
set formatoptions=tcrqn
set autoindent
set nowrap
set whichwrap=b,s,<,>,[,]
set showmatch
set matchtime=1
set incsearch 
EOF
) > /etc/vim/vimrc










