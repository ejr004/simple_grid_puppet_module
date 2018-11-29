#!/opt/puppetlabs/puppet/bin/ruby
require 'yaml'
require 'open3'

site_level_config_file_path = "/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml"

def get_hostname(site_level_config_file_path)
        site_infrastructure = Hash.new
        hostname = Array.new
        data = YAML.load_file(site_level_config_file_path)
        site_infrastructure = data["site_infrastructure"]
        site_infrastructure.each do |site_infra|
                hostname << site_infra["hostname"]
        end
        return hostname
end
# Get all elements
def get_element_ip(site_level_config_file_path)
        site_infrastructure = Hash.new
        lightweight_components = Hash.new
        type = Hash.new
        hostname = Array.new
        nodes =Array.new
        node =Array.new
        ip = Array.new
        data = YAML.load_file(site_level_config_file_path)
        site_infrastructure = data["site_infrastructure"]
        lightweight_components = data["lightweight_components"]
        lightweight_components.each do |lc|
                      nodes << lc["nodes"]
                      nodes.each do |node_array|
                        node_array.each do |value|
                        site_infrastructure.each do |site_infra|
                          if site_infra["hostname"] ==  value["node"]
                             ip << site_infra["ip_address"]
                          end
                        end
                      end
                end
        end
        return ip
end
begin

elements = get_element_ip(site_level_config_file_path)
puts elements
end
