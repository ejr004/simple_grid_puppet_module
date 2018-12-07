require 'yaml'
Puppet::Functions.create_function(:'simple_grid::download_component') do
        dispatch :download_component do
                param 'String', :site_level_config_file_path
        end
        def download_component(site_level_config_file_path)
                lightweight_components = Hash.new
                component = Hash.new
                data = YAML.load_file(site_level_config_file_path)
                lightweight_components = data["lightweight_components"]
                lightweight_components.each do |key, lc|
                        component.store(key["repository_url"],key["deploy"])
                        #puts exec_id.inspect
                end
                return component
        end
end
