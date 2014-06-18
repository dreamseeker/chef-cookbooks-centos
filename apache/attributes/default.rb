default['apache']['vhosts'][:ip_address] = '192.168.50.20'

default['apache'][:packages] = %w[
  httpd
  httpd-devel
  mod_ssl
]