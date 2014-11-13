yum_repository 'google-chrome' do
  description 'Google Chrome Repo'
  baseurl node['chrome']['yum_baseurl']
  gpgkey node['chrome']['yum_gpgkey']
  action :nothing
end.run_action(:add)

package "google-chrome-#{node['chrome']['track']}" do
  action :nothing
end.run_action(:install)
