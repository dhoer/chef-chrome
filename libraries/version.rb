# Chrome helper
module Chrome
  # Version helper
  module Version
    def chrome_version
      if platform?('windows')
        v_windows
      elsif platform?('mac_os_x')
        v_mac
      else
        v_linux
      end
    end

    # private

    def v_windows
      master_preferences_path = node['chrome']['master_preferences_windows']
      install_dir = master_preferences_path.slice(0, master_preferences_path.rindex('\\'))
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

    def v_linux
      cmd = Mixlib::ShellOut.new('google-chrome --version')
      cmd.run_command
      cmd.error!
      cmd.stdout.match(/Google Chrome (.*)/)[1]
    end
  end
end

Chef::Provider.send(:include, Chrome::Version)
Chef::Recipe.send(:include, Chrome::Version)
Chef::Resource.send(:include, Chrome::Version)
