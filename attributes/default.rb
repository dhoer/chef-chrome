default['chrome']['track'] = 'stable'
default['chrome']['32bit_only'] = false

default['chrome']['master_preferences_windows'] = 'C:\Program Files (x86)\Google\Chrome\Application\master_preferences'
default['chrome']['master_preferences_mac'] = '/Library/Google/Google Chrome Master Preferences'
default['chrome']['master_preferences_linux'] = '/opt/google/chrome/master_preferences'

default['chrome']['apt_uri'] = 'http://dl.google.com/linux/chrome/deb'
default['chrome']['apt_arch'] = 'amd64'

default['chrome']['apt_key'] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
default['chrome']['dmg_source'] = 'https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg'
default['chrome']['dmg_checksum'] = nil
default['chrome']['msi_64'] = 'https://dl-ssl.google.com/tag/s/appguid=%7B00000000-0000-0000-0000-000000000000%7D'\
  '&iid=%7B00000000-0000-0000-0000-000000000000%7D&lang=en&browser=4&usagestats=0&appname=Google%20Chrome'\
  '&needsadmin=false/dl/chrome/install/googlechromestandaloneenterprise64.msi'
default['chrome']['msi'] = 'https://dl-ssl.google.com/tag/s/appguid=%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D'\
  '&iid=%7B806F36C0-CB54-4A84-A3F3-0CF8A86575E0%7D&lang=en&browser=3&usagestats=0&appname=Google%20Chrome'\
  '&needsadmin=false/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi'
default['chrome']['yum_baseurl'] = 'http://dl.google.com/linux/chrome/rpm/stable/$basearch'
default['chrome']['yum_gpgkey'] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
