require 'spec_helper'

describe 'chrome::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'determines basename from url' do
    expect(chef_run).to install_windows_package('Google Chrome')
  end
end
