require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end


SimpleCov.start do
  clean_filters
  add_filter '/minitest/'
  add_filter '/ruby/'
  add_filter '/teamcity/'
end

require 'minitest/autorun'
require 'minitest/mock'