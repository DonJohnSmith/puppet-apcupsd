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
  if $apcupsd::ups_mode == 'single' {
    $ups_nr = ''
    file {$apcupsd::config:
      content => template('apcupsd/apcupsd.conf.erb'),
    }
  }

  elsif $apcupsd::ups_mode == 'double' {
    file {'/etc/apcupsd/apcupsd.conf':
      ensure => absent,
    }

    ['0', '1'].each | $ups_nr | {
      file {"/etc/apcupsd/apcupsd${ups_nr}.conf":
        content => template('apcupsd/apcupsd.conf.erb'),
      }

    }

  if $::osfamily == 'Debian' {
    file_line { 'is_configured':
      path => '/etc/default/apcupsd',
      line => "ISCONFIGURED=${apcupsd::is_configured}",
    }
  }
}
