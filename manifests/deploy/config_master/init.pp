class simple_grid::deploy::config_master::init {
  notify{'STAGE: Deploy on Config Master': }

  #class{'simple_grid::ccm_function::config_master::copydir':}

  notify{'Starting STAGE: Deployon Lightweight Components': }

  exec { 'Start Deploy Stage for Lightweight Components':
  command => "bash -c 'bolt task run simple_grid::deploy_lc --modulepath /etc/puppetlabs/code/environments/pre_deploy/site/ --nodes localhost'",
  path    => '/usr/local/bin/:/usr/bin/:/bin/:/opt/puppetlabs/bin/'
    }
}
