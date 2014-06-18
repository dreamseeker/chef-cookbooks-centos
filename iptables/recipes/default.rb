#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2014, TORU KOKUBUN (http://d-s-b.jp/)
# 
# Licensed under MIT Lisence:
# http://www.opensource.org/licenses/mit-license.php
# http://sourceforge.jp/projects/opensource/wiki/licenses%2FMIT_license
#

# ------------------------------------
# template
# ------------------------------------
template '/etc/sysconfig/iptables' do
  source   'iptables.erb'
  owner    'root'
  group    'root'
  mode     0600
  notifies :restart, 'service[iptables]'
end

# ------------------------------------
# service
# ------------------------------------
service 'iptables' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end