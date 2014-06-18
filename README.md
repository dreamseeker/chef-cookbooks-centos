chef cookbooks for CentOS
===============

This cookbooks builds Web Deveropment Server onto Vargrant VM.

Requirements
------------

#### platforms
- `CentOS` - tested on CentOS 6.5

and Rewrite Your Host Machine's hosts file.

Attributes
----------

#### apache::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apache']['vhosts']['ip_address']</tt></td>
    <td>String ( IP Address )</td>
    <td>VM's IP Address</td>
    <td><tt>192.168.50.20</tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['packages']</tt></td>
    <td>Array</td>
    <td>install packages list</td>
    <td><tt>%w[
  httpd
  httpd-devel
  mod_ssl
]</tt></td>
  </tr>
</table>

#### mysqld::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mysqld']['root_pwd']</tt></td>
    <td>String</td>
    <td>root Password</td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td><tt>['mysqld']['cnf']['charset']</tt></td>
    <td>String</td>
    <td>Character set</td>
    <td><tt>utf8</tt></td>
  </tr>
  <tr>
    <td><tt>['mysqld']['cnf']['storage_engine']</tt></td>
    <td>String</td>
    <td>Storage Engine</td>
    <td><tt>InnoDB</tt></td>
  </tr>
  <tr>
    <td><tt>['mysqld']['packages']</tt></td>
    <td>Array</td>
    <td>install packages list</td>
    <td><tt>%w[
  mysql-server
  mysql-devel
]</tt></td>
  </tr>
</table>

#### perl_modules::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['perl_modules']['packages']</tt></td>
    <td>Array</td>
    <td>install packages list</td>
    <td><tt>%w[
  perl-core
  perl-Archive-Tar
  perl-Archive-Zip
  perl-Authen-SASL
  perl-Class-DBI-mysql
  perl-Crypt-DSA
  perl-Crypt-SSLeay
  perl-Digest-SHA1
  perl-Cache-Memcached
  perl-DBI
  perl-DBD-mysql
  perl-Digest-SHA
  perl-GD
  perl-HTML-Parser
  perl-IO-Compress-Zlib
  perl-IO-Socket-SSL
  perl-IPC-Run
  perl-Imager
  perl-Mail-Sendmail
  perl-Net-SSLeay
  perl-Net-SMTP-SSL
  perl-Net-SMTP-TLS
  perl-XML-Parser
  ImageMagick-perl
]</tt></td>
  </tr>
</table>

#### php::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['php']['ini']['memory_limit']</tt></td>
    <td>String</td>
    <td>php.ini memory_limit</td>
    <td><tt>1024M</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['ini']['upload_max_filesize']</tt></td>
    <td>String</td>
    <td>php.ini upload_max_filesize</td>
    <td><tt>512M</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['ini']['post_max_size']</tt></td>
    <td>String</td>
    <td>php.ini post_max_size</td>
    <td><tt>578M</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['ini']['max_execution_time']</tt></td>
    <td>Integer</td>
    <td>php.ini max_execution_time</td>
    <td><tt>60</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['ini']['pmax_file_uploads']</tt></td>
    <td>Integer</td>
    <td>php.ini pmax_file_uploads</td>
    <td><tt>20</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['packages']['common']</tt></td>
    <td>Array</td>
    <td>install packages list<br>
    --enablerepo=remi</td>
    <td><tt>%w[
  php
  php-devel
  php-mbstring
  php-gd
  php-pear
  php-xml
  php-pdo
  php-mysqlnd
  php-bcmath
]</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['packages']['repo']</tt></td>
    <td>Array</td>
    <td>install packages list<br>
    --enablerepo=epel,remi,rpmforge</td>
    <td><tt>%w[
  php-mcrypt
]</tt></td>
  </tr>
</table>

#### yum::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['yum']['repo']['epel']</tt></td>
    <td>String ( URI )</td>
    <td>epel repository</td>
    <td><tt>http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['repo']['rpmforge']</tt></td>
    <td>String ( URI )</td>
    <td>rpmforge repository</td>
    <td><tt>http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['repo']['remi']</tt></td>
    <td>String ( URI )</td>
    <td>remi repository</td>
    <td><tt>http://rpms.famillecollet.com/enterprise/remi-release-6.rpm</tt></td>
  </tr>
  </tr>
</table>

Usage
-----

after download / git clone, copy contains cookbooks to your chef repo's site-cookbooks directory.

#### nodes/{your_hostname}.json

```json
{
  "run_list": [
    "role[lamp]"
  ]
}
```

#### roles/lamp.json

```json
{
  "name":        "lamp",
  "description": "build CentOS Development Web Server with LAMP",

  "chef_type":   "role",
  "json_class":  "Chef::Role",

  "default_attributes": {
  },

  "run_list": [
    "recipe[yum::add_repo]",
    "recipe[apache]",
    "recipe[apache::vhosts]",
    "recipe[iptables]",
    "recipe[php]",
    "recipe[mysqld]",
    "recipe[perl_modules]",
    "recipe[yum::update]"
  ],

  "override_attributes": {
  }
}
```

License and Authors
-------------------
Authors: TORU KOKUBUN
