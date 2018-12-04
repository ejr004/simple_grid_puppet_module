#!/opt/puppetlabs/puppet/bin/ruby
require 'yaml'

site_level_config_file_path = "/Users/gongolo/dev/puppet/simple_grid_puppet_dev_env/config_master/data/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml"

def get_lifecycle_scripts(site_level_config_file_path)
        simple_grid_site_script_dir = "/etc/simple_grid/scripts/"
        lightweight_components = Hash.new
        newhash = Hash.new
        lc_hook = Hash.new
        lc_array = Array.new
        data = YAML.load_file(site_level_config_file_path)
        lightweight_components = data["lightweight_components"]
        lightweight_components.each do |lc|
                #puts "/etc/simple_grid/scripts/"+lc["execution_id"]
                exec_id = lc["execution_id"]
                lc_hook = lc["lifecycle_hooks"]
                lc_hook.each do | key,value| 
                        puts "mkdir -p "+"#{simple_grid_site_script_dir}"+"#{exec_id}/"+"#{key}"
                end
        end
end
begin
get_lifecycle_scripts(site_level_config_file_path)

end
