class simple_grid::ccm_function::create_script_dir(
$site_level_config_file = "/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml" #TODO
){
notify {"Creating Scripts directory":}
$scripts_hash = simple_grid::aggregate_lifecycle_scripts("${site_level_config_file}")

#notify {"XXXX ${scripts_hash}.class":}


/*
  $scripts_hash.each |String $repo, Tuple $deploy|{
      notify {"${repo}":}
      $deploy.each |Integer $index, Hash $deploy_hash|{
          $node = $deploy_hash['node']
          notify{"NODE: $node":}
          #notify {"hostname: $hostname":}
          if $::hostname == $node {
          notify {'YES':}
            }
        }
      }
  $scripts_hash.each |Integer $exec_id, Hash $lc_scripts|{
    file{"/etc/simple_grid/scripts/$exec_id/":
        ensure => directory,
        mode   => "0777",
        owner  =>  root,
        group  =>  root,
      } 
      $lc_scripts.each| String $stage, String $script|{
      #  notify{"XXX$exec_id to  $stage and $script": } 
        file{"/etc/simple_grid/scripts/$exec_id/$stage/$script":
            ensure => directory,
            mode   => "0777",
            owner  =>  root,
            group  =>  root,
            source => "puppet:///simple_grid/scripts/$exec_id/$stage/$script",
            path    =>  "/etc/simple_grid/scripts/$exec_id/$stage/$script",
          }
      }
  }*/
}
