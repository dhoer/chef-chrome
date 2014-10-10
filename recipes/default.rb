windows_package 'Google Chrome' do
  source node['chrome']['src']
  action :install
end
