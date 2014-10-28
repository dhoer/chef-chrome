require 'spec_helper'

describe 'chrome::default' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'windows', version: '2008R2').converge(described_recipe) }

  it 'installs google chrome' do
    expect(chef_run).to install_windows_package('Google Chrome')
  end
end
