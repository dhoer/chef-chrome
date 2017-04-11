require 'spec_helper'

describe 'chrome_test::version' do
  context 'windows install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2') do
        allow_any_instance_of(Chef::Recipe).to receive(:chrome_version).and_return('38.0.2125.234')
      end.converge(described_recipe)
    end

    it 'returns chrome version' do
      expect(chef_run).to write_log('38.0.2125.234')
    end
  end

  context 'mac install' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.12').converge(described_recipe) }
    let(:shellout) { double(run_command: nil, error!: nil, stdout: 'Google Chrome 38.0.2125.234 ') }

    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'returns chrome version' do
      expect(chef_run).to write_log('38.0.2125.234')
    end
  end

  context 'linux install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0', step_into: ['chrome']).converge(described_recipe)
    end

    let(:shellout) { double(run_command: nil, error!: nil, stdout: 'Google Chrome 38.0.2125.234 ') }

    before { allow(Mixlib::ShellOut).to receive(:new).and_return(shellout) }

    it 'returns chrome version' do
      expect(chef_run).to write_log('38.0.2125.234')
    end
  end
end
