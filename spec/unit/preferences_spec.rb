require 'spec_helper'

describe 'chrome_test::preferences' do
  let(:chef_run) { ChefSpec::Runner.new(step_into: ['chrome']).converge(described_recipe) }

  it 'sets preferences' do
    expect(chef_run).to preferences_chrome('set_user_preferences').with(
      template: 'master_preferences.json.erb',
      local: false,
      cookbook: 'chrome',
      params: {
        homepage: 'https://www.getchef.com'
      }
    )
  end

  it 'generates master_preferences' do
    expect(chef_run).to create_template('C:\Program Files (x86)\Google\Chrome\Application\master_preferences')
  end
end
