#
# Cookbook Name:: apache
# Recipe:: vhosts
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
template '/etc/httpd/conf.d/httpd-vhosts.conf' do
  source   'httpd-vhosts.conf.erb'
  notifies :restart, 'service[httpd]', :delayed
end

template '/etc/hosts' do
  source   'hosts.erb'
  notifies :restart, 'service[httpd]', :delayed
end

# ------------------------------------
# phpinfo
# ------------------------------------
if !File.exists?('/var/www/html/test.domain')
	directory '/var/www/html/test.domain' do
	  owner 'root'
	  group 'root'
	  mode '0777'
	  action :create
	end

	# ------------------------------------
	# phpinfo
	# ------------------------------------
	template '/var/www/html/test.domain/phpinfo.php' do
	  source   'phpinfo.php.erb'
	end
end