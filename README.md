# Chrome Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/chrome.svg?style=flat-square)][cookbook]
[![linux](http://img.shields.io/travis/dhoer/chef-chrome/master.svg?label=linux&style=flat-square)][linux]
[![osx](http://img.shields.io/travis/dhoer/chef-chrome/macosx.svg?label=macosx&style=flat-square)][osx]
[![win](https://img.shields.io/appveyor/ci/dhoer/chef-chrome/master.svg?label=windows&style=flat-square)][win]

[cookbook]: https://supermarket.chef.io/cookbooks/chrome
[linux]: https://travis-ci.org/dhoer/chef-chrome
[osx]: https://travis-ci.org/dhoer/chef-chrome/branches
[win]: https://ci.appveyor.com/project/dhoer/chef-chrome

This cookbook installs Google Chrome browser (https://www.google.com/chrome/) at compile time, provides 
`chrome_version` library method  to retrieve Chrome version installed, and provides `master_preferences` resource
to set user preferences.

## Requirements

Chef 12.14+

### Platforms

- CentOS 7, Red Hat 7, Fedora
- Debian, Ubuntu
- Mac OS X
- Windows

### Cookbooks

- dmg - used by Mac OS X platform 

## Usage

Include the default recipe on a node's runlist to ensure that Chrome is installed.

A library method `chrome_version` is provided to retrieve the Chrome version installed:

```ruby
v = chrome_version
```

**Tip:** use `allow_any_instance_of` to stub chrome_version method when testing with rspec:

```ruby
allow_any_instance_of(Chef::Recipe).to receive(:chrome_version).and_return('50.0.0.0')
```

### Attributes

- `node['chrome']['track']` - For Linux only. Install stable, beta or unstable version. Default is `stable`.
- `node['chrome']['32bit_only']` - For windows only. Install 32-bit browser on 64-bit machines. Default is `false`.
- `node['chrome']['action']` - The action to use when configuring the package. Default is `:install`.

See [attributes/default.rb](https://github.com/dhoer/chef-chrome/blob/master/attributes/default.rb) for complete list 
of attributes.

## master_preferences 

Manage a template resource that configures master_preferences.
[More info...](http://www.chromium.org/administrators/configuring-other-preferences)

### Resource Attributes

- `name` - The name of the preference. 
- `cookbook` - Optional. Cookbook where the source template is. If this is not defined, Chef will use the named 
template in the cookbook where the definition is used.
- `template` - Default `master_preferences.json.erb`, source template file.
- `parameters` - Additional parameters, see Examples.

### Examples
    
The following example would look for a template named `master_preferences.json.erb` in your cookbook:

```ruby
chrome 'custom_preferences' do
  parameters(
    homepage: 'https://mycompany.com/'
    import_bookmarks_from_file: 'c:\path\to\bookmarks.html'
  )
  action :master_preferences
end
```

The Chrome cookbook comes with a `master_preferences.json.erb` template as an example. The following parameter is used 
in the template:

- `homepage` - Sets the homepage URL.

To use the default template preferences, set cookbook to `chrome`, for example:

```ruby
chrome 'set_user_preferences' do
  cookbook 'chrome'
  parameters(
    homepage: 'https://www.getchef.com'
  )
  action :master_preferences
end
```
    
The parameter specified will be used as:

- `@parameters[:homepage]`

In the template, when you write your own, the `@` is significant.

## ChefSpec Matchers

This cookbook includes custom [ChefSpec](https://github.com/sethvargo/chefspec) matchers you can use to test your 
own cookbooks.

Example Matcher Usage

```ruby
expect(chef_run).to master_preferences_chrome('name').with(
  parameters: {
    homepage: 'https://www.getchef.com'
  }
)
```
      
Cookbook Matchers

- master_preferences_chrome(name)

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/search?q=google-chrome+chef).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-chrome/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-chrome/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-chrome/blob/master/LICENSE.md) file for details.
