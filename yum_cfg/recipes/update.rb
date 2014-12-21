#
# Cookbook Name:: yum
# Recipe:: update
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
bash 'update' do
  user 'root'
  command "yum -y update"
  action :run
  notifies :restart, 'service[httpd]', :delayed
end