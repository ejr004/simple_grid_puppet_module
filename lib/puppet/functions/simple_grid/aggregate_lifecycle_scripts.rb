#!/opt/puppetlabs/puppet/bin/ruby
require 'yaml'

site_level_config_file_path = "/Users/gongolo/dev/puppet/simple_grid_puppet_dev_env/config_master/data/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml"

def get_lifecycle_scripts(site_level_config_file_path)
        simple_grid_site_script_dir = "/etc/simple_grid/scripts/"
        lightweight_components = Hash.new
        exec_id = Hash.new
        data = YAML.load_file(site_level_config_file_path)
        lightweight_components = data["lightweight_components"]
        lightweight_components.each do |key, lc|
                #exec_id = {key["execution_id"]=>key["lifecycle_hooks"]}
                exec_id.store(key["execution_id"],key["lifecycle_hooks"])
                #puts exec_id.inspect
        end
        return exec_id
end
begin
puts get_lifecycle_scripts(site_level_config_file_path)
end