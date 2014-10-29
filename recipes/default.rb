if platform?('windows')
  flavor =  node['kernel']['machine'] == 'x86_64' && !node['chrome']['32bit_only']
  windows_package 'Google Chrome' do
    source flavor ? node['chrome']['x86_64']['src'] : node['chrome']['src']
    action :nothing
  end.run_action('install')
else
  Chef::Log.warn('Chrome can only be installed on the Windows platform using this cookbook.')
end
