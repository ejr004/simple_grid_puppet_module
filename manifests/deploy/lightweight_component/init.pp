class simple_grid::deploy::lightweight_component::init(
){
  notify {"STAGE: Deploy on LC in $hostname":} 
  # Create config dir
  include 'simple_grid::ccm_function::create_config_dir'
  include 'simple_grid::ccm_function::create_script_dir'
  include 'simple_grid::ccm_function::copy_compiled_config'
  #include 'simple_grid::ccm_function::copy_script_dir'
  #Copy compiled config to LC
  #class{ 'simple_grid::ccm_function::copy':
  #    dst => '/etc/simple_grid/compiled_config.yaml',
  #    src => 'puppet:///simple_grid/simple_grid_yaml_compiler/compiled_config.yaml',
  #    }
  #create scripts dir in LC
  # class {simple_grid::ccm_function::create_dir:
  #    dir => '/etc/simple_grid/scripts/',
  #    }
  #Copy scripts to LC
  #class{ 'simple_grid::ccm_function::copy':
  #    dst => '/etc/simple_grid/scripts/',
  #    src => 'puppet:///simple_grid/scripts/${hostname}',
  #    } 

#Class['simple_grid::ccm_function::create_config_dir'] -> Class['simple_grid::ccm_function::copy']
#class {'simple_grid::pre_config::create_config_dir':}
#class {'simple_grid::pre_config::create_config_dir':}
}
