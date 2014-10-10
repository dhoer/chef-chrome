def whyrun_supported?
  true
end

action :preferences do
  converge_by('chrome_preferences') do
    template node['chrome']['master_preferences'] do
      source new_resource.template
      local new_resource.local
      cookbook new_resource.cookbook if new_resource.cookbook
      variables(
        params: new_resource.params
      )
    end
  end
end
