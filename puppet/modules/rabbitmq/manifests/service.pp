class rabbitmq::service inherits rabbitmq {

  service { 'rabbitmq-server' :
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    require     => Class['::rabbitmq::install', '::rabbitmq::config'],
  }

  exec { 'rabbitmq_management' :
    command     => "/usr/sbin/rabbitmq-plugins enable rabbitmq_management",
    unless      => "/usr/sbin/rabbitmq-plugins list -E rabbitmq_management | grep -q rabbitmq_management",
    user        => "root",
    group       => "root",
    environment => ["HOME=/root"],
    require     => Service['rabbitmq-server'],
  }
}