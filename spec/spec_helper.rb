require 'rspec'
require 'httparty'
require 'dotenv'
require_relative '../lib/open_weather'
require_relative '../lib/generators/coordinates_generator'

Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end
