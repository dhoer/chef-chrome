require 'serverspec'

# Required by serverspec
if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end

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
  when 'windows'
    describe file('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe') do
      it { should be_file }
    end

    describe file('C:\Program Files (x86)\Google\Chrome\Application\master_preferences') do
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
