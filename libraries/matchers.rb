if defined?(ChefSpec)
  def preferences_chrome(name)
    ChefSpec::Matchers::ResourceMatcher.new(:chrome, :preferences, name)
  end
end
