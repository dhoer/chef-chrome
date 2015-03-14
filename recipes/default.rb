case node['platform_family']
when 'windows'
  include_recipe 'chrome::msi'
when 'mac_os_x'
  include_recipe 'chrome::dmg'
when 'rhel', 'fedora'
  include_recipe 'chrome::yum'
when 'debian'
  include_recipe 'chrome::apt'
else
  Chef::Log.warn('Chrome cannot be installed on this platform using this cookbook.')
end
