apt_repository 'google-chrome' do
  arch node['chrome']['apt_arch']
  uri node['chrome']['apt_uri']
  distribution 'stable'
  components %w(main)
  key node['chrome']['apt_key']
  arch 'amd64' if 'x86_64' == node['kernel']['machine']
  action :nothing
end.run_action(:add)

package "google-chrome-#{node['chrome']['track']}" do
  action :nothing
end.run_action(:install)
