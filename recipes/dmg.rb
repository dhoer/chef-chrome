dmg_package 'Google Chrome' do
  dmg_name 'googlechrome'
  source node['chrome']['dmg_source']
  checksum node['chrome']['dmg_checksum']
  action :nothing
end.run_action(:install)
