require 'spec_helper'

describe 'chrome_test::master_preferences' do
  context 'windows master_preferences' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'windows',
        version: '2008R2',
        step_into: ['chrome']
      ).converge(described_recipe)
    end

    it 'does not create master_preferences directory' do
      expect(chef_run).to_not create_directory('C:\Program Files (x86)\Google\Chrome\Application')
    end

    it 'sets master_preferences' do
      expect(chef_run).to master_preferences_chrome('set_user_preferences').with(
        template: 'master_preferences.json.erb',
        local: false,
        cookbook: 'chrome',
        parameters: {
          homepage: 'https://www.getchef.com'
        }
      )
    end

    it 'generates master_preferences' do
      expect(chef_run).to create_template('C:\Program Files (x86)\Google\Chrome\Application\master_preferences')
    end
  end

  context 'mac master_preferences' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'mac_os_x',
        version: '10.12',
        step_into: ['chrome']
      ).converge(described_recipe)
    end

    it 'creates master_preferences directory' do
      expect(chef_run).to create_directory('/Library/Google')
    end

    it 'generates master_preferences' do
      expect(chef_run).to create_template('/Library/Google/Google Chrome Master Preferences')
    end
  end

  context 'linux master_preferences' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0', step_into: ['chrome']).converge(described_recipe)
    end

    it 'does not create master_preferences directory' do
      expect(chef_run).to_not create_directory('/opt/google/chrome')
    end

    it 'generates master_preferences' do
      expect(chef_run).to create_template('/opt/google/chrome/master_preferences')
    end
  end
end
