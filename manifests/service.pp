# == Class: apcupsd::service
#
# === Authors
#
# Johannes Graf <graf.johannes@gmail.com>
#
# === Copyright
#
# Copyright 2015 Johanns Graf
#
class apcupsd::service {

  service { $apcupsd::service_name:
    ensure     => $apcupsd::manage_service_ensure,
    enable     => $apcupsd::manage_service_enable,
    hasrestart => true,
    hasstatus  => false,
  }

}

