def whyrun_supported?
  true
end

action :master_preferences do
  converge_by('chrome_master_preferences') do
    if platform?('windows')
      flavor = node['chrome']['master_preferences_windows']
    elsif platform?('mac_os_x')
      flavor = node['chrome']['master_preferences_mac']
    else
      flavor = node['chrome']['master_preferences_linux']
    end

    template flavor do
      source new_resource.template
      local new_resource.local
      cookbook new_resource.cookbook if new_resource.cookbook
      variables(
        params: new_resource.params
      )
    end
  end
end
