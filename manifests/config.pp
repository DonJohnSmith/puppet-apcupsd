# == Class: apcupsd::config
#
# === Authors
#
# Johannes Graf <graf.johannes@gmail.com>
#
# === Copyright
#
# Copyright 2015 Johanns Graf
#
class apcupsd::config {

  # configuration
  file {$apcupsd::config:
    content => template('apcupsd/apcupsd.conf.erb'),
  }

  # script
  file_line { 'changeme':
    path => "${apcupsd::scriptdir}/changeme",
    line => "SYSADMIN=${apcupsd::maildest}",
  }

  file_line { 'commfailure':
    path => "${apcupsd::scriptdir}/commfailure",
    line => "SYSADMIN=${apcupsd::maildest}",
  }

  file_line { 'commok':
    path => "${apcupsd::scriptdir}/commok",
    line => "SYSADMIN=${apcupsd::maildest}",
  }

  file_line { 'offbattery':
    path => "${apcupsd::scriptdir}/offbattery",
    line => "SYSADMIN=${apcupsd::maildest}",
  }

  file_line { 'onbattery':
    path => "${apcupsd::scriptdir}/onbattery",
    line => "SYSADMIN=${apcupsd::maildest}",
  }

  case $::osfamily {
    'Debian': {
      file_line { 'is_configured':
        path => '/etc/default/apcupsd',
        line => "ISCONFIGURED=${apcupsd::is_configured}",
      }
    }
  }
}

