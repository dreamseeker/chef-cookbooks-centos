#
# Cookbook Name:: mysqld
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
template '/etc/my.cnf' do
  source   'my.cnf.erb'
  notifies :restart, 'service[mysqld]', :delayed
end

# ------------------------------------
# package
# ------------------------------------
node['mysqld']['packages'].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=remi'
    notifies :restart, 'service[mysqld]', :delayed
  end
end

# ------------------------------------
# service
# ------------------------------------
service 'mysqld' do
  action [ :enable, :start ]
end

# ------------------------------------
# bash
# ------------------------------------
script 'mysql_secure_install' do
  interpreter 'bash'
  user        'root'
  only_if     "mysql -u root -e 'show databases'"
  code <<-EOC
    mysqladmin -u root password "#{node['mysqld']['root_pwd']}"
    mysql -u root -p#{node['mysqld']['root_pwd']} -e "SET PASSWORD FOR root@localhost=PASSWORD('#{node['mysqld']['root_pwd']}');"
    mysql -u root -p#{node['mysqld']['root_pwd']} -e "SET PASSWORD FOR root@'127.0.0.1'=PASSWORD('#{node['mysqld']['root_pwd']}');"
    mysql -u root -p#{node['mysqld']['root_pwd']} -e "DELETE FROM mysql.user WHERE User='';"
    mysql -u root -p#{node['mysqld']['root_pwd']} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
    mysql -u root -p#{node['mysqld']['root_pwd']} -e "DROP DATABASE test;"
    mysql -u root -p#{node['mysqld']['root_pwd']} -e "FLUSH PRIVILEGES;"
  EOC
end
