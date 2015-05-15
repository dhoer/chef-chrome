# Changelog

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
