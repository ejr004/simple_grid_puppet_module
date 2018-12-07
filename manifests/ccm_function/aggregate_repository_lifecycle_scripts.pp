class simple_grid::ccm_function::aggregate_repository_lifecycle_scripts(
$site_level_config_file = '/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml', #TODO
$simple_grid_scripts_dir = '/etc/simple_grid/scripts'
){

  file{"${simple_grid_scripts_dir}/":
    ensure => directory,
    mode   => '0777',
    owner  =>  root,
    group  =>  root,
    }
$scripts_hash = simple_grid::aggregate_repository_lifecycle_scripts("${site_level_config_file}")
#notify {"XXXX ${scripts_hash}":} 
  $scripts_hash.each |Integer $exec_id, Hash $lc_scripts|{
      file{"${simple_grid_scripts_dir}/${exec_id}/":
        ensure => directory,
        mode   => '0777',
        owner  =>  root,
        group  =>  root,
      }
      $lc_scripts.each| String $stage, Array $script|{
          file{"${simple_grid_scripts_dir}/${exec_id}/${stage}/":
            ensure => directory,
            mode   => '0777',
            owner  =>  root,
            group  =>  root,
            }
        $script.each |String $script_str|{
          $file = split($script_str, "/")
          notify{" ${file[-1]} ": }

          file{"${simple_grid_scripts_dir}/${exec_id}/${stage}/${file[-1]}":
            ensure => directory,
            mode   => '0777',
            owner  =>  root,
            group  =>  root,
            source => "${script_str}",
            path   =>  "${simple_grid_scripts_dir}/${exec_id}/${stage}/${file[-1]}",
          }
        }
      }
  }
}
