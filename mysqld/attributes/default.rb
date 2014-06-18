default['mysqld']['cnf'][:root_pwd]       = "vagrant"
default['mysqld']['cnf'][:charset]        = "utf8"
default['mysqld']['cnf'][:storage_engine] = "InnoDB"

default['mysqld'][:packages]              = %w[
  mysql-server
  mysql-devel
]