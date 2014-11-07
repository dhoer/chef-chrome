yum_repository 'google-chrome' do
  description 'Google Chrome Repo'
  baseurl 'http://dl.google.com/linux/chrome/rpm/stable/$basearch'
  gpgkey 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  action :nothing
end.run_action(:add)

package "google-chrome-#{node['chrome']['track']}" do
  action :nothing
end.run_action(:install)
