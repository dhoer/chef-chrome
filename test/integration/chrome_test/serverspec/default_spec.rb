require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'chrome::default' do
  describe command('google-chrome --version') do
    its(:stdout) { should match(/Google Chrome /) }
    its(:exit_status) { should eq 0 }
  end
end
