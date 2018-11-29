class simple_grid::deploy::lightweight_component::init(
){
  include 'simple_grid::ccm_function::create_config_dir'
  include 'simple_grid::ccm_function::copy'

Class['simple_grid::ccm_function::create_config_dir'] -> Class['simple_grid::ccm_function::copy']
/*   class {'simple_grid::pre_config::create_config_dir':}
  class { 'simple_grid::pre_config::lightweight_component::ssh_config': }
  class {'simple_grid::pre_config::lightweight_component::reset_agent':}
  */
}
