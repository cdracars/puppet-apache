class apache {

  package { "apache2":
    ensure => installed,
  }

  service { "apache2":
    enable => true,
    ensure => running,
  }

  define apache::loadmodule () {
     exec { "/usr/sbin/a2enmod $name" :
          unless => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
          notify => Service[apache2]
     }
  }

  #apache::loadmodule{"proxy": }
  #apache::loadmodule{"proxy_http": }

}
