apt_repository 'google-chrome' do
  arch node['chrome']['apt_arch']
  uri node['chrome']['apt_uri']
  distribution node['chrome']['track']
  components %w(main)
  key node['chrome']['apt_key']
  action :nothing
end.run_action(:add)

package "google-chrome-#{node['chrome']['track']}" do
  action :nothing
end.run_action(:install)
