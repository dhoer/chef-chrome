v = chrome_version

raise "Chrome version returned is invalid: #{v}" unless v =~ /[\d|.]*/

log 'chrome version' do
  message v
end
