#!/opt/puppetlabs/puppet/bin/ruby
require 'yaml'

site_level_config_file_path = "/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml"
# 
def get_lifecycle_scripts(site_level_config_file_path)
        lightweight_components = Hash.new
        newhash = Hash.new
        lc_hook = Hash.new
        data = YAML.load_file(site_level_config_file_path)
        lightweight_components = data["lightweight_components"]
        lightweight_components.each do |lc|
               #puts "/etc/simple_grid/scripts/"+lc["execution_id"]
               #newhash = lc["execution_id"]
               lc_hook = lc["lifecycle_hooks"]
                puts lc_hook
                        lc_hook.each do | key, hook|
                        puts key
                        #puts dir exec_id 
               end
          end
end
def copy_lifecycle_scripts(exec_id,lc_hook)
end
begin
get_lifecycle_scripts(site_level_config_file_path)

end
