execute 'apt-get update' do
  only_if { platform_family?('debian') }
  action :nothing
end.run_action(:run)

include_recipe 'chrome'
