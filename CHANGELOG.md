# Changelog

## 3.0.0 2017-01-09

- Require Chef client 12.14 or greater
- Remove apt and yum cookbook dependencies

## 2.0.1 2017-01-09

- PR #15 Default apt arch to amd64

## 2.0.0 2016-10-01

- Dropped support for Chef 11

## 1.2.2 2016-06-03

- PR #11 Use the machine key as opposed to processor 

## 1.2.1 2016-05-13

- Fix #10 OSX 10.9 chrome_version throws exception

## 1.2.0 2016-05-12

- Constrain apt package to a particular arch

## 1.1.1 2015-09-27

-  Fix #7 Chef::Exceptions::InvalidRemoteFileURI on Windows platform 

## 1.1.0

- Fix FC052: Metadata uses the unimplemented "suggests" keyword
- Update metadata description, source_url and issues_url

## 1.0.12

- Remove 'Google Chrome' string from chrome_version for mac installations
- Add separate kitchen yaml for mac
- Replace contributors file with link to github

## 1.0.11

- Remove Chef 12 source_url and issues_url from metadata

## 1.0.10

- Use correct apt repository name

## 1.0.9

- Revert fix for apt-get issue with updated Google sign key

## 1.0.8

- Add apt unit tests

## 1.0.7

- Fix apt-get issue with updated Google sign key

## 1.0.6

- Fix windows master preferences path

## 1.0.5

- Fix mac issues

## 1.0.4

- Fix rubocop offenses

## 1.0.3

- Fix readme rendering issue on supermarket

## 1.0.2

- Rename .chefignore to chefignore

## 1.0.1

- Fix Chef Client 12 introduced error: undefined method `new' for Chrome:Module
- Remove trailing space from chrome_version
- Add .chefignore

## 1.0.0

- Support multiple platforms
- Rename preferences resource to master_preferences

## 0.4.0

- Add 64-bit support for windows

## 0.3.0

- Add chrome_version method
- Install Chrome at compile time
- Warn if not windows platform

## 0.2.0

- Add preferences resource

## 0.1.0

- Initial release
