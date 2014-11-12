# Chrome helper
module Chrome
  def chrome_version
    if platform?('windows')
      v_win
    elsif platform?('mac_os_x')
      v_mac
    else
      v_nix
    end
  end

  # private

  def v_win
    install_dir = node['chrome']['win_preferences'].slice(0, node['chrome']['win_preferences'].rindex('\\'))
    entries = ::Dir.entries(install_dir).reverse # chefspec stub hint: see spec/unit/version_spec.rb
    entries.each do |filename|
      return filename if filename[/^[\d|.].*$/]
    end
  end

  def v_mac
    cmd = Mixlib::ShellOut.new('"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --version')
    cmd.run_command
    cmd.error!
    cmd.stdout.strip
  end

  def v_nix
    cmd = Mixlib::ShellOut.new('google-chrome --version')
    cmd.run_command
    cmd.error!
    cmd.stdout.match(/Google Chrome (.*)/)[1]
  end
end

Chef::Provider.send(:include, Chrome)
Chef::Recipe.send(:include, Chrome)
Chef::Resource.send(:include, Chrome)
