# Chrome Cookbook

[![Build Status](https://travis-ci.org/dhoer/chef-chrome.svg)](https://travis-ci.org/dhoer/chef-chrome)

This cookbook installs Google Chrome browser (https://www.google.com/chrome/) and provides a resource to set [ default user preferences](https://support.google.com/chrome/a/answer/187948?hl=en).

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

### Preferences

Manage a template resource for configuring [master preferences](http://www.chromium.org/administrators/configuring-other-preferences).

#### Resource Attributes

Current attributes used by preferences:

- name - The name of the preference. 
- cookbook - Optional. Cookbook where the source template is. If this is not defined, Chef will use the named template in the cookbook where the definition is used.
- template - Default `master_preferences.json.erb`, source template file.
- params - Additional parameters, see Examples.

#### Examples
    
The following example would look for a template named `master_preferences.json.erb` in your cookbook.

```ruby
chrome 'custom_preferences' do
  params(
    homepage: 'https://mycompany.com/'
    import_bookmarks_from_file: 'c:\path\to\bookmarks.html'
  )
  action :preferences
end
```

The chrome cookbook comes with a `master_preferences.json.erb` template as an example. The following parameter is used in the template:

- `homepage` - Sets the homepage URL.

To use the default template preferences, set cookbook to `chrome`, for example:

```ruby
chrome 'set_user_preferences' do
  cookbook 'chrome'
  params(
    homepage: 'https://www.getchef.com'
  )
  action :preferences
end
```
    
The parameter specified will be used as:

- `@params[:homepage]`

In the template, when you write your own, the `@` is significant.

### Attributes

- `node['chrome']['src']` - URI to Google Chrome FTW (MSI installer).
- `node['chrome']['master_preferences']` - Path to Chrome master_preferences file.

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-chrome).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-chrome/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-chrome/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-chrome/blob/master/LICENSE.md) file for details.
