require 'yaml'
Puppet::Functions.create_function(:'simple_grid::aggregate_lifecycle_scripts') do
        dispatch :get_lifecycle_scripts do
                param 'String', :site_level_config_file_path
        end
        def get_lifecycle_scripts(site_level_config_file_path)
                simple_grid_site_script_dir = "/etc/simple_grid/scripts/"
                lightweight_components = Hash.new
                exec_id = Hash.new
                data = YAML.load_file(site_level_config_file_path)
                lightweight_components = data["lightweight_components"]
                lightweight_components.each do |key, lc|
                        exec_id.store(key["execution_id"],key["lifecycle_hooks"])
                        #puts exec_id.inspect
                end
                return exec_id
        end
end