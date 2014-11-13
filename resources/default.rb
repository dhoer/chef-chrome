actions :master_preferences
default_action :master_preferences

attribute :name, kind_of: String, name_attribute: true
attribute :template, kind_of: String, default: 'master_preferences.json.erb'
attribute :local, kind_of: [TrueClass, FalseClass], default: false
attribute :cookbook, kind_of: String, default: nil
attribute :params, kind_of: [Array, Hash], default: []
