# @summary Manages the different services.
#
class jitsimeet::services {

  $services = [ 'jitsi-videobridge2',
                'jicofo' ]

  $services.each |String $service| {
    service { $service:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      provider   => 'systemd',
      require    => Package['jitsi-meet'],
    }
  }
}
