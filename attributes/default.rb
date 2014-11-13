default['chrome']['track'] = 'stable'
default['chrome']['32bit_only'] = false

default['chrome']['win_preferences'] = 'C:\Program Files (x86)\Google\Chrome\Application\master_preferences'

default['chrome']['apt_uri'] = 'http://dl.google.com/linux/chrome/deb'
default['chrome']['apt_key'] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
default['chrome']['dmg_source'] = 'https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg'
default['chrome']['dmg_checksum'] = '7daa2dc5c46d9bfb14f1d7ff4b33884325e5e63e694810adc58f14795165c91a'
default['chrome']['msi_64'] = 'https://dl-ssl.google.com/tag/s/appguid={00000000-0000-0000-0000-000000000000}'\
  '&iid={00000000-0000-0000-0000-000000000000}&lang=en&browser=4&usagestats=0&appname=Google Chrome&needsadmin=false'\
  '/dl/chrome/install/googlechromestandaloneenterprise64.msi'
default['chrome']['msi'] = 'https://dl-ssl.google.com/tag/s/appguid={8A69D345-D564-463C-AFF1-A69D9E530F96}'\
  '&iid={806F36C0-CB54-4A84-A3F3-0CF8A86575E0}&lang=en&browser=3&usagestats=0&appname=Google Chrome&needsadmin=false'\
  '/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi'
default['chrome']['yum_baseurl'] = 'http://dl.google.com/linux/chrome/rpm/stable/$basearch'
default['chrome']['yum_gpgkey'] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
