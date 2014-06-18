#
# Cookbook Name:: yum
# Recipe:: add_repo
#
# Copyright 2014, TORU KOKUBUN (http://d-s-b.jp/)
# 
# Licensed under MIT Lisence:
# http://www.opensource.org/licenses/mit-license.php
# http://sourceforge.jp/projects/opensource/wiki/licenses%2FMIT_license
#

# ------------------------------------
# bash
# ------------------------------------
if !File.exists?('/etc/yum.repos.d/remi.repo')
  # epel
  bash 'add_epel' do
    user 'root'
    code <<-EOC
      rpm -ivh #{node['yum']['repo']['epel']}
      sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/epel.repo
    EOC
  end

  # rpmforge
  bash 'add_rpmforge' do
    user 'root'
    code <<-EOC
      rpm -ivh #{node['yum']['repo']['rpmforge']}
      sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/rpmforge.repo
    EOC
  end

  #remi
  bash 'add_remi' do
    not_if { File.exists?("/etc/yum.repos.d/remi.repo") }
    user 'root'
    code <<-EOC
      rpm -ivh #{node['yum']['repo']['remi']}
      sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/remi.repo
    EOC
  end
end