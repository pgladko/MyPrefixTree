require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end


SimpleCov.start do
  clean_filters
  add_filter '/ruby/'
end

require 'test/unit'
