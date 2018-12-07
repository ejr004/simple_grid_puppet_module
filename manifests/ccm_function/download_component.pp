class simple_grid::ccm_function::download_component(
$site_level_config_file = "/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml" #TODO
){

$lc = simple_grid::download_component("${site_level_config_file}")
#notify {"XXXX ${lc}":}
  $lc.each |String $repo, Tuple $value|{
      notify {"$repo and ${value["node"]}":} 
    }

}
