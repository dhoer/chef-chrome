if defined?(ChefSpec)
  def master_preferences_chrome(name)
    ChefSpec::Matchers::ResourceMatcher.new(:chrome, :master_preferences, name)
  end
end
