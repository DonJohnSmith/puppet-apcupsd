# == Class: apcupsd
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
class apcupsd (
  String[1, 8]
  $upsname,
  Enum['simple', 'smart', 'ether', 'usb']
  $upscable               = $apcupsd::params::upscable,
  Enum['apcsmart', 'usb', 'net', 'snmp', 'dumb', 'pcnet']
  $upstype                = $apcupsd::params::upstype,
  String $device          = $apcupsd::params::device,
  Integer $onbatterydelay = $apcupsd::params::onbatterydelay,
  Integer $batterylevel   = $apcupsd::params::batterylevel,
  Integer $minutes        = $apcupsd::params::minutes,
  Enum['on', 'off']
  $netserver              = $apcupsd::params::netserver,
  String $maildest        = $apcupsd::params::maildest,
  String['yes', 'no']
  $is_configured          = $apcupsd::params::is_configured,
  String $manage_service_ensure  = $apcupsd::params::manage_service_ensure,
  Boolean $manage_service_enable = $apcupsd::params::manage_service_enable,
  String $nisip = $apcupsd::paramas::nisip,
) inherits apcupsd::params {

  class {'apcupsd::install': } ->
  class {'apcupsd::config': } ~>
  class {'apcupsd::service': } ->
  Class['apcupsd']
}

