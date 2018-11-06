require 'yaml'
Puppet::Functions.create_function(:'simple_grid::site_config_parser') do
        dispatch :parse_param do
                param 'String', :site_level_config_file_path
                param 'String', :query
        end
        def site_config_parser()
                "YOLO"
        end
        #def parse_param(site_level_config_file_path, query)
        #        data = YAML.load_file(site_level_config_file_path)
        #        data['site_infrastructure']
        #end
        def parse_param(site_level_config_file_path, query)
                data = YAML.load_file(site_level_config_file_path)
                data['site_infrastructure']
        end
end
