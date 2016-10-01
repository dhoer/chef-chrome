def whyrun_supported?
  true
end

use_inline_resources

action :master_preferences do
  flavor = case node['platform']
           when 'windows'
             node['chrome']['master_preferences_windows']
           when 'mac_os_x'
             node['chrome']['master_preferences_mac']
           else
             node['chrome']['master_preferences_linux']
           end

  directory master_preferences_path(flavor) do
    recursive true
    only_if { platform?('mac_os_x') }
  end

  template flavor do
    source new_resource.template
    local new_resource.local
    cookbook new_resource.cookbook
    variables(
      params: new_resource.params
    )
  end
end
