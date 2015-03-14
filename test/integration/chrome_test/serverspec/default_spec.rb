require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'chrome::default' do
  case os[:family]
  when 'darwin'
    describe command('/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version') do
      its(:stdout) { should match(/Google Chrome /) }
      its(:exit_status) { should eq 0 }
    end

    describe file('/Library/Google/Google Chrome Master Preferences') do
      it { should be_file }
      its(:content) { should match %r{"homepage" : "https://www.getchef.com",} }
    end
  else
    describe command('google-chrome --version') do
      its(:stdout) { should match(/Google Chrome /) }
      its(:exit_status) { should eq 0 }
    end

    describe file('/opt/google/chrome/master_preferences') do
      it { should be_file }
      its(:content) { should match %r{"homepage" : "https://www.getchef.com",} }
    end
  end
end
