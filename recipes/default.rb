if platform_family?('windows')
  include_recipe 'chrome::msi'
elsif platform_family?('mac_os_x')
  include_recipe 'chrome::dmg'
elsif platform_family?('rhel', 'fedora')
  include_recipe 'chrome::yum'
elsif platform_family?('debian')
  include_recipe 'chrome::apt'
else
  Chef::Log.warn('Chrome cannot be installed on this platform using this cookbook.')
end
