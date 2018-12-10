class simple_grid::ccm_function::download_component(
$site_level_config_file = '/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml' #TODO
){
notify {"Downloading component for ${hostname}":}
$lc = simple_grid::download_component("${site_level_config_file}")
notify {"XXXX ${lc}":}
  $lc.each |String $repo, Tuple $deploy|{
      notify {"${repo}":}
      $deploy.each |Integer $index, Hash $deploy_hash|{
          $node = $deploy_hash['node']
          notify{"NODE: ${node}":}
          #notify {"hostname: $hostname":}
          if $::hostname == $node {
            notify {"YES ${repo}":}
            $dir = split($repo, '/')
            notify{" ${dir[-1]} ": }
            vcsrepo { "/etc/simple_grid/${dir[-1]}":#TODO
                ensure   => present,
                provider => git,
                source   => "${repo}",
              }
            }
        }
      }
}
