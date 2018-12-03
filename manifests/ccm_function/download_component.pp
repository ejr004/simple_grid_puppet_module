class simple_grid::ccm_function::download_component(

){
vcsrepo { 'Download components':
  ensure   => present,
  provider => git,
  source   => '',
  }
}
