require 'spec_helper'

describe 'chrome_test::version' do
  context 'returns version for windows install' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2') do
        allow(::Dir).to receive(:entries) { %w(. .. 38.0.2125.104 38.0.2125.234 master_preferences) }
      end.converge(described_recipe)
    end

    it 'includes chrome default recipe' do
      expect(chef_run).to include_recipe('chrome::default')
    end

    it 'returns latest chrome version' do
      expect(chef_run).to write_log('38.0.2125.234')
    end
  end

  context 'returns version for windows install' do
    let(:chef_run) do
      ChefSpec::Runner.new do
        allow(::Dir).to receive(:entries) { %w(. .. 38.0.2125.104 38.0.2125.234 master_preferences) }
      end.converge(described_recipe)
    end

    it 'returns nothing' do
      expect(chef_run).to_not write_log('38.0.2125.234')
    end
  end
end
