# Chrome Cookbook

[![Build Status](https://travis-ci.org/dhoer/chef-chrome.svg)](https://travis-ci.org/dhoer/chef-chrome)

This cookbook installs Google Chrome browser (https://www.google.com/chrome/).

## Requirements

Chef 11.14.2 and Ruby 1.9.3 or higher.

### Platform

- Windows Server 2012 R2

### Cookbooks

- windows

## Usage

Add `recipe[chrome]` to a run list.

Get version installed:

```ruby
Registry.get_value('HKEY_CURRENT_USER\Software\Google\Chrome\BLBeacon', 'version')
```

### Attributes

- `node['chrome']['src']` - URI to Google Chrome FTW (MSI installer).

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-chrome).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-chrome/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-chrome/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-chrome/blob/master/LICENSE.md) file for details.
