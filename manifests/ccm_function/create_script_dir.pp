class simple_grid::ccm_function::create_script_dir(
){
  file{"Create and copy script dir":
    ensure  => "present",
    recurse => "true",
    mode    => "0777",
    source  => "puppet:///simple_grid/scripts/${hostname}",
    path    =>  "/etc/simple_grid/scripts/",
  }
}
