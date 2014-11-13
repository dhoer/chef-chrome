v = chrome_version

fail "Chrome version returned is invalid: #{v}" unless v.match(/[\d|.]*/)

log 'chrome version' do
  message v
end
