def chrome_version
  case node['platform']
  when 'windows'
    chrome_windows_version
  when 'mac_os_x'
    chrome_linux_version('"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --version')
  else
    chrome_linux_version('google-chrome --version')
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

def chrome_linux_version(command)
  cmd = Mixlib::ShellOut.new(command)
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
