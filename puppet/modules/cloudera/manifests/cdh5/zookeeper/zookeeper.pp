class cloudera::cdh5::zookeeper::zookeeper(
  $zookeeper_config_dir = $cloudera::cdh5::zookeeper::params::zookeeper_config_dir,
  $zookeeper_log_dir    = $cloudera::cdh5::zookeeper::params::zookeeper_log_dir,
  $zookeeper_data_dir   = $cloudera::cdh5::zookeeper::params::zookeeper_data_dir,
  $zookeeper_nodes      = $cloudera::cdh5::zookeeper::params::zookeeper_nodes,
  $user                 = $cloudera::cdh5::zookeeper::params::user,
  $group                = $cloudera::cdh5::zookeeper::params::group,
  $zookeeper_heap_size  = $cloudera::cdh5::zookeeper::params::zookeeper_heap_size,
) inherits cloudera::cdh5::zookeeper::params {
  class { '::cloudera::cdh5::zookeeper::install': } ->
  class { '::cloudera::cdh5::zookeeper::config': }->
  class { '::cloudera::cdh5::zookeeper::service': }
  contain '::cloudera::cdh5::zookeeper::install'
  contain '::cloudera::cdh5::zookeeper::config'
  contain '::cloudera::cdh5::zookeeper::service'
}
