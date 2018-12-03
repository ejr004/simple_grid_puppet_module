class simple_grid::ccm_function::copy_compiled_config(
){
  # ccm_function_copy from src to dest
  file{"/etc/simple_grid/compiled_config.yaml":
    mode   => "0777",
    owner  =>  root,
    group  =>  root,
    source => "puppet:///simple_grid/simple_grid_yaml_compiler/compiled_config.yaml"
  }
}
