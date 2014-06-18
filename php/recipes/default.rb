#
# Cookbook Name:: php
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
node['php']['packages']['common'].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=remi'
    notifies :restart, 'service[httpd]', :delayed
  end
end

node['php']['packages']['repo'].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=epel,remi,rpmforge'
    notifies :restart, 'service[httpd]', :delayed
  end
end

# ------------------------------------
# template
# ------------------------------------
template '/etc/php.ini' do
  source   'php.ini.erb'
  notifies :restart, 'service[httpd]', :delayed
end