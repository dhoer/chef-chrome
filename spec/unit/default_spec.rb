require 'spec_helper'

describe 'chrome_test::default' do
  context 'msi' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2').converge(described_recipe) }

    it 'installs google' do
      expect(chef_run).to install_windows_package('Google Chrome')
    end
  end

  context 'dmg' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.7.4').converge(described_recipe) }

    it 'installs chrome' do
      expect(chef_run).to install_dmg_package('Google Chrome')
    end
  end

  context 'yum' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0').converge(described_recipe) }

    it 'adds repo' do
      expect(chef_run).to add_yum_repository('google-chrome')
    end

    it 'installs chrome' do
      expect(chef_run).to install_package('google-chrome-stable')
    end
  end

  context 'apt' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

    it 'performs apt-get update' do
      expect(chef_run).to run_execute('apt-get update')
    end

    it 'adds repo' do
      expect(chef_run).to add_apt_repository('google-chrome')
    end

    it 'installs chrome' do
      expect(chef_run).to install_package('google-chrome-stable')
    end
  end
end
