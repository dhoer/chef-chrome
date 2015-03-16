def chrome_version
  case node['platform']
  when 'windows'
    chrome_windows_version
  when 'mac_os_x'
    chrome_mac_version
  else
    chrome_linux_version
  end
end

private

def chrome_windows_version
  master_preferences_path = node['chrome']['master_preferences_windows']
  install_dir = master_preferences_path.slice(0, master_preferences_path.rindex('\\'))
  entries = ::Dir.entries(install_dir).reverse # chefspec hint: see spec/unit/version_spec.rb
  entries.each do |filename|
    return filename if filename[/^[\d|.].*$/]
  end
end

def chrome_mac_version
  cmd = Mixlib::ShellOut.new('"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --version')
  cmd.run_command
  cmd.error!
  cmd.stdout.strip
end

def chrome_linux_version
  cmd = Mixlib::ShellOut.new('google-chrome --version')
  cmd.run_command
  cmd.error!
  cmd.stdout.match(/Google Chrome (.*)/)[1].strip
end

def master_preferences_path(flavor)
  if flavor.include? '\\'
    flavor.slice(0, flavor.rindex('\\'))
  elsif flavor.include? '/'
    flavor.slice(0, flavor.rindex('/'))
  end
end
