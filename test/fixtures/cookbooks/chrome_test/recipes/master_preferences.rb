chrome 'set_user_preferences' do
  cookbook 'chrome'
  params(
    homepage: 'https://www.getchef.com'
  )
  action :master_preferences
end
