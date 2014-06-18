default['php']['ini'][:memory_limit]        = "1024M"
default['php']['ini'][:upload_max_filesize] = "512M"
default['php']['ini'][:post_max_size]       = "578M"
default['php']['ini'][:max_execution_time]  = 60
default['php']['ini'][:max_file_uploads]    = 20

default['php']['packages'][:common]  = %w[
  php
  php-devel
  php-mbstring
  php-gd
  php-pear
  php-xml
  php-pdo
  php-mysqlnd
  php-bcmath
]

default['php']['packages'][:repo]   = %w[
  php-mcrypt
]