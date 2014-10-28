if platform?('windows')
  windows_package 'Google Chrome' do
    source node['chrome']['src']
    action :nothing
  end.run_action('install')
else
  Chef::Log.warn('Chrome can only be installed on the Windows platform using this cookbook.')
end
