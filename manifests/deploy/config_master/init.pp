class simple_grid::deploy::config_master::init {
  notify{'STAGE: Deploy on Config Master': }

  #class{'simple_grid::ccm_function::config_master::copydir':}

  notify{'Starting STAGE: Deploy on Lightweight Components': }
  exec{"swarm init for LC":
                  command => "bolt task run simple_grid::deploy_lc --modulepath /etc/puppetlabs/code/environments/deploy/site/ --nodes localhost",
                  path    => '/usr/local/bin/:/usr/bin/:/bin/:/opt/puppetlabs/bin/',
                  user    => 'root',
                  }
}
