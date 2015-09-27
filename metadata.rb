name 'chrome'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs/Configures Chrome browser'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.1'

supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'
supports 'fedora'
supports 'mac_os_x'
supports 'debian'
supports 'ubuntu'
supports 'windows'

depends 'apt', '~> 2.3'
depends 'dmg', '~> 2.2'
depends 'yum', '~> 3.2'
depends 'windows', '~> 1.0'

source_url 'https://github.com/dhoer/chef-chrome' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-chrome/issues' if respond_to?(:issues_url)
