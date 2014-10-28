# Chrome helper
module Chrome
  def chrome_version
    install_dir = node['chrome']['master_preferences'].slice(0, node['chrome']['master_preferences'].rindex('\\'))
    install_dir = 'c:\selenium2'
    entries = ::Dir.entries(install_dir).reverse
    entries.each do |name|
      return name if name[/^[\d|.].*$/]
    end
  end
end

Chef::Provider.send(:include, Chrome)
Chef::Recipe.send(:include, Chrome)
Chef::Resource.send(:include, Chrome)
