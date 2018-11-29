require 'rspec'
require_relative '../lib/open_weather'
require_relative '../lib/generators/coordinates_generator'

RSpec.configure do |config|
  config.formatter = :documentation
end
