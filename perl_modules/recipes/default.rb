#
# Cookbook Name:: perl_modules
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
# - perl-Cache-File と PSGI 関連のモジュールを除き、ひと通りインストール
# ------------------------------------
node['perl_modules']['packages'].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=epel,remi,rpmforge'
    notifies :restart, 'service[httpd]', :delayed
  end
end
