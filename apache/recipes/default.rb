#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, TORU KOKUBUN (http://d-s-b.jp/)
# 
# Licensed under MIT Lisence:
# http://www.opensource.org/licenses/mit-license.php
# http://sourceforge.jp/projects/opensource/wiki/licenses%2FMIT_license
#

# ------------------------------------
# package
# ------------------------------------
node['apache']['packages'].each do |pkg|
  package "#{pkg}" do
    action :install
    notifies :restart, 'service[httpd]', :delayed
  end
end

# ------------------------------------
# service
# ------------------------------------
service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

# ------------------------------------
# template
# ------------------------------------
template '/etc/httpd/conf/httpd.conf' do
  source   'httpd.conf.erb'
  notifies :restart, 'service[httpd]'
end
