class simple_grid::ccm_function::create_config_dir(
$dest,$src,
$simple_config_dir = lookup('simple_grid::simple_config_dir')
){
  # ccm_function_copy from src to dest
  file{"${dest}":
    mode   => "0777",
    owner  =>  root,
    group  =>  root,
    path   => "${src}"
  }
}
