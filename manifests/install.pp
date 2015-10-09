# == Class: apcupsd::install
#
# === Authors
#
# Johannes Graf <graf.johannes@gmail.com>
#
# === Copyright
#
# Copyright 2015 Johanns Graf
#
class apcupsd::install {

  package { $apcupsd::package_name:
    ensure => $apcupsd::package_version,
  }

}

