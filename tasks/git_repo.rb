#!/opt/puppetlabs/puppet/bin/ruby
require 'yaml'
require 'open3'
require 'puppet'

site_level_config_file_path = "/etc/simple_grid/simple_grid_site_config/site-level-configuration-file.yaml"
simple_grid_path = "/etc/simple_grid/"

def exec_git_repo(git_url,simple_grid_path)
  cmd_string = "git clone "
  cmd_string << " --snapshot-interval=#{}" unless snapshot_interval.nil?
end

# Get all elements
def get_repo_url(site_level_config_file_path,hostname)
        site_infrastructure = Hash.new
        lightweight_components = Hash.new
        type = Hash.new
        nodes = Array.new
        node = Array.new
        ip = Array.new
        data = YAML.load_file(site_level_config_file_path)
        site_infrastructure = data["site_infrastructure"]
        lightweight_components = data["lightweight_components"].sort_by { |k,v| k["execution_id"] }
        lightweight_components.each do |lc|
                        deploy_array = lc["deploy"]
                        deploy_array.each do |deploy|
                                node_name =  deploy['node']
                                site_infrastructure.each do |site_infra|
                                        if site_infra["hostname"] == node_name
                                                ip << site_infra["ip_address"]
                                        end
                                end
                        end                
        end
        return ip
end
# Exec Puppet agent -t (Stage Deploy)
def exec_puppet_agent(elements)
        elements = Hash.new
        elements.each do |element|
           exec_id
           puts "** Starting puppet agent on #{ip} **"
           exec_cmd = "bolt command run "+"'"+"puppet agent -t"+ "'" + " --nodes  #{ip}"
           puts  "***"
           puts exec_cmd
           puts  "***"
           #system exec_cmd
         end
end  
params = JSON.parse(STDIN.read)
params['']

begin

elements = get_element_ip(site_level_config_file_path)
puts elements
exec_puppet_agent(elements)
end
