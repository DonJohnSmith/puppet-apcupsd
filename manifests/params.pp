# == Class: apcupsd::params
#
# === Authors
#
# Jonathan / djjudas21
# Johannes Graf <graf.johannes@gmail.com>
#
# === Copyright
#
# Copyright 2015 Jonathan / djjudas21
# Copyright 2015 Johanns Graf
#
class apcupsd::params {

  case $::osfamily {
    'Debian': {
      $package_name = 'apcupsd'
      $service_name = 'apcupsd'
      $config       = '/etc/apcupsd/apcupsd.conf'
      $scriptdir    = '/etc/apcupsd'
    }
    'RedHat': {
      $package_name = 'apcupsd'
      $service_name = 'apcupsd'
      $config       = '/etc/apcupsd/apcupsd.conf'
      $scriptdir    = '/etc/apcupsd'
    }
    default: {
      fail("${::osfamily} is not supported by ${module_name}")
    }
  }

  $package_version = 'latest'

  $upsname = 'apc'

  $manage_service_ensure = 'running'

  $manage_service_enable = true

  $maildest = 'root'

  $is_configured = 'yes'

  $nisip = '0.0.0.0'

  $upscable = 'usb'

  $upstype = 'usb'

  $device = ''

  $onbatterydelay = 6

  $batterylevel = 5

  $minutes = 3

  $netserver = 'off'
}
