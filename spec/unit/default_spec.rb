require 'spec_helper'

describe 'chrome::default' do
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
    context 'msi' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2').converge(described_recipe)
      end

      it 'installs google' do
        expect(chef_run).to install_windows_package('Google Chrome')
      end
    end
  end

  context 'dmg' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.12').converge(described_recipe) }
    let(:shellout) { double(run_command: nil, error!: nil, stdout: 'Google Chrome 38.0.2125.234 ') }

    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'installs chrome' do
      expect(chef_run).to install_dmg_package('Google Chrome')
    end
  end

  context 'yum' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0').converge(described_recipe) }
    let(:shellout) { double(run_command: nil, error!: nil, stdout: 'Google Chrome 38.0.2125.234 ') }

    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'adds repo' do
      expect(chef_run).to add_yum_repository('google-chrome')
    end

    it 'installs chrome' do
      expect(chef_run).to install_package('google-chrome-stable')
    end
  end

  context 'apt' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
    let(:shellout) { double(run_command: nil, error!: nil, stdout: 'Google Chrome 38.0.2125.234 ') }

    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'adds repo' do
      expect(chef_run).to add_apt_repository('google-chrome')
    end

    it 'installs chrome' do
      expect(chef_run).to install_package('google-chrome-stable')
    end
  end
end
